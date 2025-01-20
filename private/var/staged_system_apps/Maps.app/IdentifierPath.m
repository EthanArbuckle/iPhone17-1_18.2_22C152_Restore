@interface IdentifierPath
+ (IdentifierPath)identifierPathWithIdentifier:(id)a3;
+ (IdentifierPath)identifierPathWithIdentifiers:(id)a3;
+ (id)identifierPath;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IdentifierPath)init;
- (IdentifierPath)initWithIdentifiers:(id)a3;
- (NSArray)identifiers;
- (NSString)firstIdentifier;
- (NSString)lastIdentifier;
- (NSString)visualDescription;
- (id)identifierPathByAppendingIdentifier:(id)a3;
- (id)identifierPathByPrependingIdentifier:(id)a3;
- (id)identifierPathByRemovingFirstIdentifier;
- (id)identifierPathByRemovingLastIdentifier;
- (unint64_t)hash;
- (unint64_t)length;
@end

@implementation IdentifierPath

- (BOOL)isEqual:(id)a3
{
  v4 = (IdentifierPath *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(IdentifierPath *)v4 identifiers];
      unsigned __int8 v6 = [v5 isEqualToArray:self->_identifiers];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)hasPrefix:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (id v6 = [v4 length], v6 <= (id)-[NSArray count](self->_identifiers, "count")))
  {
    if ([v5 length])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v5 identifiers];
        v11 = [v10 objectAtIndexedSubscript:v9];
        v12 = [(NSArray *)self->_identifiers objectAtIndexedSubscript:v9];
        unsigned __int8 v7 = [v11 isEqualToString:v12];

        if ((v7 & 1) == 0) {
          break;
        }
        ++v9;
      }
      while (v9 < (unint64_t)[v5 length]);
    }
    else
    {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = 0;
  for (NSUInteger i = 0; ; ++i)
  {
    NSUInteger v5 = [(NSArray *)self->_identifiers count] > 7 ? 8 : [(NSArray *)self->_identifiers count];
    if (i >= v5) {
      break;
    }
    id v6 = [(NSArray *)self->_identifiers objectAtIndexedSubscript:i];
    unint64_t v3 = (unint64_t)[v6 hash] ^ (2 * v3);
  }
  return v3;
}

- (unint64_t)length
{
  return [(NSArray *)self->_identifiers count];
}

- (id)identifierPathByAppendingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(NSArray *)self->_identifiers arrayByAddingObject:v4];

  id v7 = [v5 initWithIdentifiers:v6];

  return v7;
}

+ (IdentifierPath)identifierPathWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v9 = v4;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];

  id v7 = [v5 initWithIdentifiers:v6];

  return (IdentifierPath *)v7;
}

- (IdentifierPath)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdentifierPath;
  id v5 = [(IdentifierPath *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSArray arrayWithArray:v4];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v6;
  }
  return v5;
}

- (NSString)visualDescription
{
  v2 = [(IdentifierPath *)self identifiers];
  unint64_t v3 = [v2 componentsJoinedByString:@" - "];
  id v4 = +[NSString stringWithFormat:@"{%@}", v3];

  return (NSString *)v4;
}

- (NSString)firstIdentifier
{
  return (NSString *)[(NSArray *)self->_identifiers firstObject];
}

- (void).cxx_destruct
{
}

+ (id)identifierPath
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (IdentifierPath)identifierPathWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifiers:v4];

  return (IdentifierPath *)v5;
}

- (IdentifierPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)IdentifierPath;
  id v2 = [(IdentifierPath *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)&__NSArray0__struct;
  }
  return v3;
}

- (NSString)lastIdentifier
{
  return (NSString *)[(NSArray *)self->_identifiers lastObject];
}

- (id)identifierPathByRemovingLastIdentifier
{
  if ([(NSArray *)self->_identifiers count])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = -[NSArray subarrayWithRange:](self->_identifiers, "subarrayWithRange:", 0, (char *)[(NSArray *)self->_identifiers count] - 1);
    id v5 = (IdentifierPath *)[v3 initWithIdentifiers:v4];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

- (id)identifierPathByPrependingIdentifier:(id)a3
{
  identifiers = self->_identifiers;
  id v5 = a3;
  objc_super v6 = +[NSMutableArray arrayWithCapacity:(char *)[(NSArray *)identifiers count] + 1];
  [v6 addObject:v5];

  [v6 addObjectsFromArray:self->_identifiers];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithIdentifiers:v6];

  return v7;
}

- (id)identifierPathByRemovingFirstIdentifier
{
  if ([(NSArray *)self->_identifiers count])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    id v4 = -[NSArray subarrayWithRange:](self->_identifiers, "subarrayWithRange:", 1, (char *)[(NSArray *)self->_identifiers count] - 1);
    id v5 = (IdentifierPath *)[v3 initWithIdentifiers:v4];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

@end