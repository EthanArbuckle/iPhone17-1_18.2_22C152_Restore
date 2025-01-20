@interface UIFont(Workflow)
+ (id)chicletDescriptionFont;
+ (id)chicletTitleFont;
+ (id)galleryCollectionSubtitleFont;
+ (id)galleryCollectionTitleFont;
+ (id)gallerySearchCollectionSubtitleFont;
+ (id)gallerySearchCollectionTitleFont;
+ (id)gallerySuggestionTextFont;
+ (uint64_t)galleryCardDescriptionFont;
+ (uint64_t)galleryCollectionSeeAllButtonFont;
+ (uint64_t)galleryWorkflowDescriptionFont;
+ (uint64_t)galleryWorkflowNameFont;
+ (uint64_t)setupFlowButtonFont;
+ (uint64_t)setupFlowFieldFont;
+ (uint64_t)workflowsFooterFont;
@end

@implementation UIFont(Workflow)

+ (id)chicletDescriptionFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:0x8000];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)chicletTitleFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:32770];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)gallerySuggestionTextFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:0x8000];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)galleryCardDescriptionFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (id)gallerySearchCollectionSubtitleFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:0x8000];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)gallerySearchCollectionTitleFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)galleryCollectionSeeAllButtonFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (uint64_t)galleryWorkflowDescriptionFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:14.0 weight:*MEMORY[0x263F81838]];
}

+ (uint64_t)galleryWorkflowNameFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:*MEMORY[0x263F81840]];
}

+ (id)galleryCollectionSubtitleFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:0x8000];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)galleryCollectionTitleFont
{
  v0 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
  v1 = [v0 fontDescriptor];
  v2 = [v1 fontDescriptorWithSymbolicTraits:2];

  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (uint64_t)setupFlowFieldFont
{
  return [MEMORY[0x263F81708] systemFontOfSize:15.0];
}

+ (uint64_t)setupFlowButtonFont
{
  return [MEMORY[0x263F81708] boldSystemFontOfSize:15.0];
}

+ (uint64_t)workflowsFooterFont
{
  return [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
}

@end