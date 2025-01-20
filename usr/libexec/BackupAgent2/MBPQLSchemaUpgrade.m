@interface MBPQLSchemaUpgrade
+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 statements:(id)a5;
+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 upgradeBlock:(id)a5;
- (BOOL)shouldVacuum;
- (id)upgradeBlock;
- (unsigned)version;
- (void)setShouldVacuum:(BOOL)a3;
- (void)setUpgradeBlock:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation MBPQLSchemaUpgrade

+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 statements:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007A1A0;
  v10[3] = &unk_1000F1E50;
  id v11 = a5;
  id v7 = v11;
  v8 = +[MBPQLSchemaUpgrade upgradeWithVersion:v6 shouldVacuum:v5 upgradeBlock:v10];

  return v8;
}

+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 upgradeBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  v8 = objc_opt_new();
  [v8 setVersion:v6];
  [v8 setShouldVacuum:v5];
  id v9 = [v7 copy];

  [v8 setUpgradeBlock:v9];

  return v8;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (id)upgradeBlock
{
  return self->_upgradeBlock;
}

- (void)setUpgradeBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end