@interface SUViewControllerContext
+ (BOOL)supportsSecureCoding;
- (NSString)sectionIdentifier;
- (SUViewControllerContext)initWithCoder:(id)a3;
- (id)_typeStringForType:(int64_t)a3;
- (id)copyViewController;
- (id)description;
- (id)valueForMetadataKey:(id)a3;
- (int64_t)_typeForTypeString:(id)a3;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3 forMetadataKey:(id)a4;
@end

@implementation SUViewControllerContext

- (SUViewControllerContext)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUViewControllerContext.m", 50, @"Must use keyed-coding");
  }
  v6 = [(SUViewControllerContext *)self init];
  if (v6)
  {
    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v6->_metadata = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithObjects:", v18, v17, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0), @"metadata");
    v6->_sectionIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"section"];
    if ([a3 containsValueForKey:@"typeString"]) {
      uint64_t v15 = -[SUViewControllerContext _typeForTypeString:](v6, "_typeForTypeString:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"typeString"]);
    }
    else {
      uint64_t v15 = [a3 decodeIntegerForKey:@"type"];
    }
    v6->_type = v15;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUViewControllerContext.m", 76, @"Must use keyed-coding");
  }
  [a3 encodeObject:self->_metadata forKey:@"metadata"];
  [a3 encodeObject:self->_sectionIdentifier forKey:@"section"];
  [a3 encodeInteger:self->_type forKey:@"type"];
  id v6 = [(SUViewControllerContext *)self _typeStringForType:self->_type];

  [a3 encodeObject:v6 forKey:@"typeString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  self->_metadata = 0;
  self->_sectionIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerContext;
  [(SUViewControllerContext *)&v3 dealloc];
}

- (id)copyViewController
{
  uint64_t v3 = 0;
  while (__SUContextMap[v3] != self->_type)
  {
    v3 += 2;
    if (v3 == 12) {
      return 0;
    }
  }
  v4 = NSClassFromString((NSString *)__SUContextMap[v3 + 1]);
  if (v4)
  {
    id v5 = objc_alloc_init(v4);
    [v5 restoreArchivableContext:self];
    return v5;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerContext;
  return (id)[NSString stringWithFormat:@"%@: %ld, %@", -[SUViewControllerContext description](&v3, sel_description), -[SUViewControllerContext type](self, "type"), -[SUViewControllerContext sectionIdentifier](self, "sectionIdentifier")];
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  metadata = self->_metadata;
  if (a3)
  {
    if (!metadata)
    {
      metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_metadata = metadata;
    }
    [(NSMutableDictionary *)metadata setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)metadata removeObjectForKey:a4];
  }
}

- (id)valueForMetadataKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadata objectForKey:a3];
}

- (int64_t)_typeForTypeString:(id)a3
{
  if ([a3 isEqualToString:@"storepage"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"overlay"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"overlay-bg"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"split-view"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"navigation"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"searchpage"]) {
    return 6;
  }
  return 0;
}

- (id)_typeStringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_264812988[a3 - 1];
  }
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end