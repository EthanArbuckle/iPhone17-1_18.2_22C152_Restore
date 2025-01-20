@interface GQDSParentResolutionEntry
- (GQDSParentResolutionEntry)initWithStyle:(id)a3 parentIdentifier:(const char *)a4;
- (const)parentIdentifier;
- (id)style;
- (void)dealloc;
@end

@implementation GQDSParentResolutionEntry

- (GQDSParentResolutionEntry)initWithStyle:(id)a3 parentIdentifier:(const char *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GQDSParentResolutionEntry;
  v6 = [(GQDSParentResolutionEntry *)&v8 init];
  if (v6)
  {
    v6->mStyle = (GQDSStyle *)a3;
    v6->mParentIdentifier = (char *)xmlStrdup((const xmlChar *)a4);
  }
  return v6;
}

- (void)dealloc
{
  mParentIdentifier = self->mParentIdentifier;
  if (mParentIdentifier) {
    xmlFree(mParentIdentifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDSParentResolutionEntry;
  [(GQDSParentResolutionEntry *)&v4 dealloc];
}

- (id)style
{
  return self->mStyle;
}

- (const)parentIdentifier
{
  return self->mParentIdentifier;
}

@end