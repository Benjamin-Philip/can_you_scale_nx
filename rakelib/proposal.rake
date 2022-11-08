require 'rake/clean'

multitask :proposal => ["proposal/proposal.md", "proposal/proposal.pdf"]

file "proposal/proposal.md" => "proposal/proposal.org" do
  sh "pandoc -f org -t markdown -o proposal/proposal.md proposal/proposal.org"
end

file "proposal/proposal.pdf" => "proposal/proposal.org" do
  sh "pandoc -f org -t pdf -o proposal/proposal.pdf proposal/proposal.org"
end

CLOBBER.include("proposal/proposal.pdf")
CLOBBER.include("proposal/proposal.md")
