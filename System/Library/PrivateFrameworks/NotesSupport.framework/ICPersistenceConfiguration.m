@interface ICPersistenceConfiguration
- (NSManagedObjectContext)legacyBackgroundContext;
- (NSManagedObjectContext)legacyViewContext;
- (NSManagedObjectContext)modernBackgroundContext;
- (NSManagedObjectContext)modernViewContext;
- (id)makeLegacyBackgroundContext;
- (id)makeModernBackgroundContext;
- (void)setLegacyViewContext:(id)a3;
- (void)setMakeLegacyBackgroundContext:(id)a3;
- (void)setMakeModernBackgroundContext:(id)a3;
- (void)setModernViewContext:(id)a3;
@end

@implementation ICPersistenceConfiguration

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (NSManagedObjectContext)modernBackgroundContext
{
  v2 = [(ICPersistenceConfiguration *)self makeModernBackgroundContext];
  v3 = v2[2]();

  return (NSManagedObjectContext *)v3;
}

- (id)makeModernBackgroundContext
{
  return self->_makeModernBackgroundContext;
}

- (void)setMakeModernBackgroundContext:(id)a3
{
}

- (void)setMakeLegacyBackgroundContext:(id)a3
{
}

- (void)setModernViewContext:(id)a3
{
}

- (void)setLegacyViewContext:(id)a3
{
}

- (NSManagedObjectContext)legacyBackgroundContext
{
  v2 = [(ICPersistenceConfiguration *)self makeLegacyBackgroundContext];
  v3 = v2[2]();

  return (NSManagedObjectContext *)v3;
}

- (id)makeLegacyBackgroundContext
{
  return self->_makeLegacyBackgroundContext;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_makeLegacyBackgroundContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong(&self->_makeModernBackgroundContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
}

@end