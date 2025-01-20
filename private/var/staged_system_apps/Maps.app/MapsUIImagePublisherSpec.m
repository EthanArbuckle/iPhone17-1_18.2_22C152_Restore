@interface MapsUIImagePublisherSpec
- (BOOL)isEqual:(id)a3;
- (MapsUIImagePublisherSpec)initWithIconIdentifier:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (unint64_t)hash;
- (unsigned)iconIdentifier;
- (void)setIconIdentifier:(unsigned int)a3;
@end

@implementation MapsUIImagePublisherSpec

- (MapsUIImagePublisherSpec)initWithIconIdentifier:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapsUIImagePublisherSpec;
  result = [(MapsUIImagePublisherSpec *)&v5 init];
  if (result) {
    *(_DWORD *)(&result->super._isRTL + 3) = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return [(MapsUIImagePublisherSpec *)self iconIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsUIImagePublisherSpec *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unsigned int v6 = [(MapsUIImagePublisherSpec *)self iconIdentifier];
      unsigned int v7 = [(MapsUIImagePublisherSpec *)v5 iconIdentifier];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MapsUIImagePublisherSpec);
  [(MapsUIImagePublisherSpec *)v4 setIconIdentifier:[(MapsUIImagePublisherSpec *)self iconIdentifier]];
  return v4;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  uint64_t v5 = [(MapsUIImagePublisherSpec *)self iconIdentifier];

  return +[MKIconManager imageForIconID:v5 contentScale:1 sizeGroup:0 nightMode:a3];
}

- (unsigned)iconIdentifier
{
  return *(_DWORD *)(&self->super._isRTL + 3);
}

- (void)setIconIdentifier:(unsigned int)a3
{
  *(_DWORD *)(&self->super._isRTL + 3) = a3;
}

@end