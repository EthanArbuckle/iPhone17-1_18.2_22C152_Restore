@interface _PASDatabaseMigrationContext
- (id)description;
@end

@implementation _PASDatabaseMigrationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->migrations, 0);
  objc_storeStrong((id *)&self->db, 0);

  objc_storeStrong((id *)&self->object, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(_PASSqliteDatabase *)self->db filename];
  v5 = (void *)[v3 initWithFormat:@"<_PASDatabaseMigrationContext db:%@ v:%u mc:%tu>", v4, self->version, -[NSDictionary count](self->migrations, "count")];

  return v5;
}

@end