@interface PGGraphPublicEventLocalizedCategoryNode
- (BOOL)hasProperties:(id)a3;
- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 level:(unint64_t)a4;
- (id)description;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)level;
- (unsigned)domain;
@end

@implementation PGGraphPublicEventLocalizedCategoryNode

- (void).cxx_destruct
{
}

- (unint64_t)level
{
  return *((unsigned __int8 *)self + 32);
}

- (id)label
{
  return self->_label;
}

- (unsigned)domain
{
  return 902;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventLocalizedCategoryNode;
  v4 = [(PGGraphOptimizedNode *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ (level = %d)", v4, *((unsigned __int8 *)self + 32)];

  return v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"lvl";
  v2 = [NSNumber numberWithUnsignedInteger:*((unsigned __int8 *)self + 32)];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"lvl"];
    objc_super v7 = v6;
    BOOL v8 = !v6 || [v6 unsignedIntegerValue] == *((unsigned __int8 *)self + 32);
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a3;
  BOOL v8 = [a5 objectForKeyedSubscript:@"lvl"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [(PGGraphPublicEventLocalizedCategoryNode *)self initWithLabel:v7 level:v9];
  return v10;
}

- (PGGraphPublicEventLocalizedCategoryNode)initWithLabel:(id)a3 level:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphPublicEventLocalizedCategoryNode;
  id v7 = [(PGGraphNode *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    label = v7->_label;
    v7->_label = (NSString *)v8;

    *((unsigned char *)v7 + 32) = v4;
  }

  return v7;
}

@end