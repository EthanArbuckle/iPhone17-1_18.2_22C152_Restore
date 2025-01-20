@interface ML3DatabaseNaturalStatement
+ (BOOL)supportsSecureCoding;
+ (id)naturalStatementWithSQL:(id)a3 parameters:(id)a4;
- (ML3DatabaseNaturalStatement)initWithCoder:(id)a3;
- (ML3DatabaseNaturalStatement)initWithSQL:(id)a3 parameters:(id)a4;
- (NSMutableArray)parameters;
- (NSString)sql;
- (void)encodeWithCoder:(id)a3;
- (void)setParameter:(id)a3 forPosition:(unint64_t)a4;
- (void)setParameters:(id)a3;
- (void)setSql:(id)a3;
@end

@implementation ML3DatabaseNaturalStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_sql, 0);
}

- (void)setParameters:(id)a3
{
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setSql:(id)a3
{
}

- (NSString)sql
{
  return self->_sql;
}

- (void)encodeWithCoder:(id)a3
{
  sql = self->_sql;
  id v5 = a3;
  [v5 encodeObject:sql forKey:@"ML3DatabaseNaturalStatementSQLKey"];
  [v5 encodeObject:self->_parameters forKey:@"ML3DatabaseNaturalStatementParametersKey"];
}

- (ML3DatabaseNaturalStatement)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseNaturalStatement;
  id v5 = [(ML3DatabaseNaturalStatement *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ML3DatabaseNaturalStatementSQLKey"];
    sql = v5->_sql;
    v5->_sql = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parameters = v5->_parameters;
    v5->_parameters = v8;

    v10 = MSVPropertyListDataClasses();
    v11 = [v10 setByAddingObject:objc_opt_class()];

    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"ML3DatabaseNaturalStatementParametersKey"];
    if (v12) {
      [(NSMutableArray *)v5->_parameters addObjectsFromArray:v12];
    }
  }
  return v5;
}

- (void)setParameter:(id)a3 forPosition:(unint64_t)a4
{
  id v10 = a3;
  unint64_t v6 = a4 - 1;
  if (v6 >= [(NSMutableArray *)self->_parameters count])
  {
    unint64_t v7 = [(NSMutableArray *)self->_parameters count];
    if (v7 <= v6)
    {
      unint64_t v8 = v7;
      do
      {
        v9 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)self->_parameters setObject:v9 atIndexedSubscript:v8];

        ++v8;
      }
      while (v8 <= v6);
    }
  }
  [(NSMutableArray *)self->_parameters setObject:v10 atIndexedSubscript:v6];
}

- (ML3DatabaseNaturalStatement)initWithSQL:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ML3DatabaseNaturalStatement;
  unint64_t v8 = [(ML3DatabaseNaturalStatement *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sql = v8->_sql;
    v8->_sql = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parameters = v8->_parameters;
    v8->_parameters = v11;

    if (v7) {
      [(NSMutableArray *)v8->_parameters addObjectsFromArray:v7];
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)naturalStatementWithSQL:(id)a3 parameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSQL:v6 parameters:v5];

  return v7;
}

@end