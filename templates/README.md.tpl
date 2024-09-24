### Howdy 👋

My name is [Skip Baney](https://twelvelabs.com), and I occasionally write software.

#### 👷 Check out what I'm currently working on
{{ range recentContributions 5 }}
- [{{.Repo.Name}}]({{.Repo.URL}}){{with .Repo.Description}} - {{.}}{{end}} ({{humanize .OccurredAt}})
{{- end }}

#### 🔭 Latest releases I've contributed to
{{ range recentReleases 5 }}
- [{{.Name}}]({{.URL}}) ([{{.LastRelease.TagName}}]({{.LastRelease.URL}}), {{humanize .LastRelease.PublishedAt}}){{with .Description}} - {{.}}{{end}}
{{- end }}

#### ⭐ Recent stars
{{ range recentStars 5 }}
- [{{.Repo.Name}}]({{.Repo.URL}}){{with .Repo.Description}} - {{.}}{{end}} ({{humanize .StarredAt}})
{{- end }}

#### 📜 My recent blog posts
{{ range rss "https://twelvelabs.com/posts/index.xml" 5 }}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end }}

#### 📫 How to reach me

- Twitter: <https://twitter.com/twelvelabs>
- Blog: <https://twelvelabs.com>

---

<sup>Generated with [readme-scribe](https://github.com/muesli/readme-scribe)</sup>
