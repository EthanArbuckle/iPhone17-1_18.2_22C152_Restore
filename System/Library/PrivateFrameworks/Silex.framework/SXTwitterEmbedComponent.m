@interface SXTwitterEmbedComponent
- (id)classification;
- (id)embedType;
- (id)type;
- (unint64_t)traits;
@end

@implementation SXTwitterEmbedComponent

- (id)type
{
  return @"embed";
}

- (id)embedType
{
  return @"tweet";
}

- (id)classification
{
  v3 = [(SXTwitterEmbedComponent *)self type];
  v4 = [(SXJSONObject *)self specificationVersion];
  v5 = +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v3, v4);

  v6 = -[SXFullscreenCaption caption]((uint64_t)v5);

  if (v6)
  {
    uint64_t v7 = -[SXFullscreenCaption caption]((uint64_t)v5);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SXTwitterEmbedComponent;
    uint64_t v7 = [(SXComponent *)&v10 classification];
  }
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)traits
{
  return 32;
}

@end