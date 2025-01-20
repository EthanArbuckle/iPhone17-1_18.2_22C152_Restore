@interface CNVCardLine
+ (id)lineWithLiteralValue:(id)a3;
+ (id)lineWithName:(id)a3 value:(id)a4;
+ (id)lineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5;
+ (id)versionPlaceholderLine;
- (BOOL)canSerializeWithStrategy:(id)a3;
- (CNVCardLine)initWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5;
- (NSArray)groupedLines;
- (NSArray)parameters;
- (NSString)groupingName;
- (NSString)itemSeparator;
- (NSString)name;
- (id)makeGroupingNameWithCounter:(int64_t *)a3;
- (id)value;
- (void)addGroupedLine:(id)a3 withCounter:(int64_t *)a4;
- (void)addParameterWithName:(id)a3 value:(id)a4;
- (void)insertParameterWithName:(id)a3 value:(id)a4 atIndex:(unint64_t)a5;
- (void)serializeValueWithStrategy:(id)a3;
- (void)serializeWithStrategy:(id)a3;
@end

@implementation CNVCardLine

+ (id)lineWithName:(id)a3 value:(id)a4
{
  return (id)[a1 lineWithName:a3 value:a4 itemSeparator:0];
}

+ (id)lineWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 value:v9 itemSeparator:v8];

  return v11;
}

+ (id)lineWithLiteralValue:(id)a3
{
  return +[CNVCardLiteralLine lineWithLiteralValue:a3];
}

+ (id)versionPlaceholderLine
{
  return +[CNVCardVersionPlaceholderLine line];
}

- (CNVCardLine)initWithName:(id)a3 value:(id)a4 itemSeparator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNVCardLine *)self init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong(&v11->_value, a4);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parameters = v11->_parameters;
    v11->_parameters = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    groupedLines = v11->_groupedLines;
    v11->_groupedLines = v16;

    uint64_t v18 = [v10 copy];
    itemSeparator = v11->_itemSeparator;
    v11->_itemSeparator = (NSString *)v18;

    v20 = v11;
  }

  return v11;
}

- (void)addParameterWithName:(id)a3 value:(id)a4
{
  id v5 = +[CNVCardParameter parameterWithName:a3 value:a4];
  [(NSMutableArray *)self->_parameters _cn_addNonNilObject:v5];
}

- (void)insertParameterWithName:(id)a3 value:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = +[CNVCardParameter parameterWithName:a3 value:a4];
  [(NSMutableArray *)self->_parameters _cn_insertNonNilObject:v7 atIndex:a5];
}

- (void)addGroupedLine:(id)a3 withCounter:(int64_t *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    if (!self->_grouping)
    {
      id v7 = [(CNVCardLine *)self makeGroupingNameWithCounter:a4];
      grouping = self->_grouping;
      self->_grouping = v7;
    }
    [(NSMutableArray *)self->_groupedLines addObject:v9];
  }
  MEMORY[0x1F41817F8]();
}

- (id)makeGroupingNameWithCounter:(int64_t *)a3
{
  int64_t v3 = *a3 + 1;
  *a3 = v3;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"item%ld", v3);
}

- (BOOL)canSerializeWithStrategy:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [v4 canSerializeString:self->_value];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [v4 canSerializeArray:self->_value];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v6 = 0;
        goto LABEL_8;
      }
      char v5 = [v4 canSerializeData:self->_value];
    }
  }
  BOOL v6 = v5;
LABEL_8:

  return v6;
}

- (void)serializeWithStrategy:(id)a3
{
}

- (void)serializeValueWithStrategy:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  id v4 = self->_value;
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    [v13 serializeString:v6];
  }
  else
  {
    objc_opt_class();
    id v7 = self->_value;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      id v10 = [(CNVCardLine *)self itemSeparator];
      [v13 serializeArray:v9 withItemSeparator:v10];
    }
    else
    {
      objc_opt_class();
      id v11 = self->_value;
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v10 = v12;

      if (v10) {
        [v13 serializeData:v10];
      }
    }
  }
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)groupingName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)groupedLines
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)itemSeparator
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSeparator, 0);
  objc_storeStrong((id *)&self->_groupedLines, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end