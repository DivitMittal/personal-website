<script lang="ts">
	import Fa from 'svelte-fa';
	import type { IconDefinition } from '@fortawesome/free-brands-svg-icons';

	export let faIcon: IconDefinition;
	export let anchor: string;
	export let link: string;
	export let overrideText: string | boolean = false;
</script>

<li id={anchor} class="social">
	<div class="icon">
		<Fa icon={faIcon} />
	</div>
	<a href={link}>{overrideText ? overrideText : '#' + anchor}</a>
</li>

<style lang="scss">
	.social {
		display: flex;
		gap: 0.5rem;

		a:hover {
			color: var(--white);
		}
	}

	.icon {
		text-align: center;
		width: 1.5rem;
	}

	:target {
		color: #ff0052;
		animation-name: pulse;
		animation-duration: 1s;
		animation-fill-mode: forwards;
		animation-iteration-count: infinite;
		border-radius: 8px;
	}
</style>