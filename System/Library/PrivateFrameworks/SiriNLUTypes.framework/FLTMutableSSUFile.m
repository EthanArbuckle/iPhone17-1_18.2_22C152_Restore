@interface FLTMutableSSUFile
- (FLTMutableSSUFile)init;
- (FLTSSUMetadata)metadata;
- (NSArray)categories;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)format_version;
- (void)setCategories:(id)a3;
- (void)setFormat_version:(unsigned __int16)a3;
- (void)setLocale:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation FLTMutableSSUFile

- (void)setCategories:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)categories
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"categories"];
}

- (void)setLocale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"locale"];
}

- (void)setMetadata:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FLTSSUMetadata)metadata
{
  return (FLTSSUMetadata *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"metadata"];
}

- (void)setFormat_version:(unsigned __int16)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedShort:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)format_version
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"format_version"];
  unsigned __int16 v3 = [v2 unsignedShortValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableSSUFile)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableSSUFile;
  v2 = [(FLTMutableSSUFile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end