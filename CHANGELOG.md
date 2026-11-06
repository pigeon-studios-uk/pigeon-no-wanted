# Changelog

All notable changes to Pigeon No Wanted are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

First release.

### Highlights

- No wanted level, or a cap you choose
- No AI police, SWAT, army or helicopters
- No AI ambulances and fire engines turning up
- Each AI service chosen on its own
- No random police NPCs

### Added

- The wanted level capped at `Config.MaxWantedLevel` (0 by default) and cleared straight away above it.
- AI police told to ignore players, with `Config.PoliceIgnorePlayers`.
- GTA's 14 AI dispatch services, from police cars to the army, ambulances, fire engines and gangs, each turned off or kept in `Config.Services`.
- Random police NPCs on foot, in scenarios and in traffic turned off with `Config.RandomCops`.
- Every setting applied again every `Config.ReapplySeconds`, and GTA's defaults put back when the resource stops.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-no-wanted/commits/main
