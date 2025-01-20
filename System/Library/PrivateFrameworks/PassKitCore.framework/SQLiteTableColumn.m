@interface SQLiteTableColumn
- (NSString)name;
- (NSString)qualifiers;
- (id)SQL;
- (id)description;
- (void)setName:(id)a3;
- (void)setQualifiers:(id)a3;
@end

@implementation SQLiteTableColumn

- (id)SQL
{
  if (self->_qualifiers)
  {
    v3 = +[NSString stringWithFormat:@"\"%@\"", self->_name];
    v4 = +[NSString stringWithFormat:@"%@ %@", v3, self->_qualifiers];
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"\"%@\"", self->_name];
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"[%@][%@]", self->_name, self->_qualifiers];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)qualifiers
{
  return self->_qualifiers;
}

- (void)setQualifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end