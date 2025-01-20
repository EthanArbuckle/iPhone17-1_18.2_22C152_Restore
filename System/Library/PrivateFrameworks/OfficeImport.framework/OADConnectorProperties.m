@interface OADConnectorProperties
+ (id)defaultProperties;
- (OADConnectorProperties)init;
- (OADConnectorProperties)initWithDefaults;
- (id)description;
- (id)from;
- (id)to;
@end

@implementation OADConnectorProperties

- (OADConnectorProperties)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADConnectorProperties;
  v2 = [(OADProperties *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADConnection);
    v4 = *(void **)&v2->super.mIsTextBox;
    *(void *)&v2->super.mIsTextBox = v3;

    v5 = objc_alloc_init(OADConnection);
    mFrom = v2->mFrom;
    v2->mFrom = v5;
  }
  return v2;
}

+ (id)defaultProperties
{
  if (+[OADConnectorProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADConnectorProperties defaultProperties]::once, &__block_literal_global_54);
  }
  v2 = (void *)+[OADConnectorProperties defaultProperties]::defaultProperties;
  return v2;
}

- (OADConnectorProperties)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)OADConnectorProperties;
  v2 = [(OADGraphicProperties *)&v8 initWithDefaults];
  if (v2)
  {
    v3 = objc_alloc_init(OADConnection);
    v4 = *(void **)&v2->super.mIsTextBox;
    *(void *)&v2->super.mIsTextBox = v3;

    v5 = objc_alloc_init(OADConnection);
    mFrom = v2->mFrom;
    v2->mFrom = v5;
  }
  return v2;
}

- (id)from
{
  return *(id *)&self->super.mIsTextBox;
}

- (id)to
{
  return self->mFrom;
}

void __43__OADConnectorProperties_defaultProperties__block_invoke()
{
  v0 = [[OADConnectorProperties alloc] initWithDefaults];
  v1 = (void *)+[OADConnectorProperties defaultProperties]::defaultProperties;
  +[OADConnectorProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADConnectorProperties;
  v2 = [(OADGraphicProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFrom, 0);
  objc_storeStrong((id *)&self->super.mIsTextBox, 0);
}

@end