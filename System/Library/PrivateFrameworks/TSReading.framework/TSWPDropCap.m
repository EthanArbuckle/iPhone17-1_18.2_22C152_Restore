@interface TSWPDropCap
+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 lineCount:(unint64_t)a5;
+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacing:(id)a5;
+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)spacings;
- (TSSPropertyMap)characterStyleOverridePropertyMap;
- (TSWPDropCap)initWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)charCount;
- (unint64_t)computedFlagsForSpacing:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSWPDropCap

- (TSWPDropCap)initWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPDropCap;
  v8 = [(TSWPDropCap *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_charCount = a3;
    v8->_characterStyleOverridePropertyMap = (TSSPropertyMap *)[a4 copy];
    v9->_spacings = (NSArray *)[a5 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCap;
  [(TSWPDropCap *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t charCount = self->_charCount;
  characterStyleOverridePropertyMap = self->_characterStyleOverridePropertyMap;
  spacings = self->_spacings;

  return (id)[v4 initWithCharCount:charCount characterStyleOverridePropertyMap:characterStyleOverridePropertyMap spacings:spacings];
}

- (unint64_t)computedFlagsForSpacing:(id)a3
{
  return [a3 computedFlagsWithPropertyMap:self->_characterStyleOverridePropertyMap];
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 lineCount:(unint64_t)a5
{
  v10[1] = *MEMORY[0x263EF8340];
  id v8 = objc_alloc((Class)a1);
  v10[0] = +[TSWPDropCapSpacing dropCapSpacingWithLineCount:a5 elevatedLineCount:0];
  return (id)objc_msgSend(v8, "initWithCharCount:characterStyleOverridePropertyMap:spacings:", a3, a4, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1));
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacing:(id)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  id v8 = objc_alloc((Class)a1);
  if (a5)
  {
    v11[0] = a5;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return (id)[v8 initWithCharCount:a3 characterStyleOverridePropertyMap:a4 spacings:v9];
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5
{
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCharCount:characterStyleOverridePropertyMap:spacings:", a3, a4, objc_msgSend(a5, "tsu_map:", &__block_literal_global_75));

  return v5;
}

id __79__TSWPDropCap_dropCapWithCharCount_characterStyleOverridePropertyMap_spacings___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    unint64_t v6 = [(TSWPDropCap *)self charCount];
    if (v6 == [v5 charCount])
    {
      LODWORD(v4) = -[NSArray isEqualToArray:](-[TSWPDropCap spacings](self, "spacings"), "isEqualToArray:", [v5 spacings]);
      if (v4)
      {
        v7 = [(TSWPDropCap *)self characterStyleOverridePropertyMap];
        if (v7 == (TSSPropertyMap *)[v5 characterStyleOverridePropertyMap])
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          id v8 = [(TSWPDropCap *)self characterStyleOverridePropertyMap];
          uint64_t v9 = [v5 characterStyleOverridePropertyMap];
          LOBYTE(v4) = [(TSSPropertyMap *)v8 isEqual:v9];
        }
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TSWPDropCap *)self charCount];
  unint64_t v4 = v3 ^ (4
           * [(TSSPropertyMap *)[(TSWPDropCap *)self characterStyleOverridePropertyMap] hash]);
  return v4 ^ ([(NSArray *)[(TSWPDropCap *)self spacings] hash] << 10);
}

- (id)description
{
  unint64_t v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: charCount=%lu map=%@ spacings=%@>", NSStringFromClass(v4), self->_charCount, self->_characterStyleOverridePropertyMap, self->_spacings];
}

- (unint64_t)charCount
{
  return self->_charCount;
}

- (TSSPropertyMap)characterStyleOverridePropertyMap
{
  return self->_characterStyleOverridePropertyMap;
}

- (NSArray)spacings
{
  return self->_spacings;
}

@end