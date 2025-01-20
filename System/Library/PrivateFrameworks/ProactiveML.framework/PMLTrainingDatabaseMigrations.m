@interface PMLTrainingDatabaseMigrations
+ (id)mockMigrationsByAddingQueries:(id)a3;
+ (id)skipFromZeroSchema:(unsigned int *)a3;
- (NSDictionary)migrations;
- (PMLTrainingDatabaseMigrations)init;
- (PMLTrainingDatabaseMigrations)initWithMigrations:(id)a3;
- (unsigned)maxVersion;
@end

@implementation PMLTrainingDatabaseMigrations

- (void).cxx_destruct
{
}

- (NSDictionary)migrations
{
  return self->_migrations;
}

- (unsigned)maxVersion
{
  v2 = [(PMLTrainingDatabaseMigrations *)self migrations];
  v3 = [v2 allKeys];

  v4 = [v3 valueForKeyPath:@"@max.unsignedIntValue"];
  unsigned int v5 = [v4 unsignedIntValue];

  return v5;
}

- (PMLTrainingDatabaseMigrations)init
{
  v12[26] = *MEMORY[0x263EF8340];
  v11[0] = &unk_26D3362A8;
  v11[1] = &unk_26D3362C0;
  v12[0] = &unk_26D3365F0;
  v12[1] = &unk_26D336608;
  v11[2] = &unk_26D3362D8;
  v11[3] = &unk_26D3362F0;
  v12[2] = &unk_26D336620;
  v12[3] = &unk_26D336638;
  v11[4] = &unk_26D336308;
  v11[5] = &unk_26D336320;
  v12[4] = &unk_26D336650;
  v12[5] = &unk_26D336668;
  v11[6] = &unk_26D336338;
  v11[7] = &unk_26D336350;
  v12[6] = &unk_26D336680;
  v12[7] = &unk_26D336698;
  v11[8] = &unk_26D336368;
  v11[9] = &unk_26D336380;
  v12[8] = &unk_26D3366B0;
  v12[9] = &unk_26D3366C8;
  v12[10] = &unk_26D3366E0;
  v11[10] = &unk_26D336398;
  v11[11] = &unk_26D3363B0;
  v3 = NSDictionary;
  v4 = [MEMORY[0x263F08D40] valueWithPointer:migrateSessionsToFloats];
  unsigned int v5 = [v3 dictionaryWithObject:v4 forKey:@"migrationFunction"];
  v10 = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v12[11] = v6;
  v12[12] = &unk_26D3366F8;
  v11[12] = &unk_26D3363C8;
  v11[13] = &unk_26D3363E0;
  v12[13] = &unk_26D336710;
  v12[14] = &unk_26D336728;
  v11[14] = &unk_26D3363F8;
  v11[15] = &unk_26D336410;
  v12[15] = &unk_26D336740;
  v12[16] = &unk_26D336758;
  v11[16] = &unk_26D336428;
  v11[17] = &unk_26D336440;
  v12[17] = &unk_26D336770;
  v12[18] = &unk_26D336788;
  v11[18] = &unk_26D336458;
  v11[19] = &unk_26D336470;
  v12[19] = &unk_26D3367A0;
  v12[20] = &unk_26D3367B8;
  v11[20] = &unk_26D336488;
  v11[21] = &unk_26D3364A0;
  v12[21] = &unk_26D3367D0;
  v12[22] = &unk_26D3367E8;
  v11[22] = &unk_26D3364B8;
  v11[23] = &unk_26D3364D0;
  v12[23] = &unk_26D336800;
  v12[24] = &unk_26D336818;
  v11[24] = &unk_26D3364E8;
  v11[25] = &unk_26D336500;
  v12[25] = &unk_26D336830;
  v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:26];
  v8 = [(PMLTrainingDatabaseMigrations *)self initWithMigrations:v7];

  return v8;
}

- (PMLTrainingDatabaseMigrations)initWithMigrations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLTrainingDatabaseMigrations;
  v6 = [(PMLTrainingDatabaseMigrations *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_migrations, a3);
  }

  return v7;
}

+ (id)skipFromZeroSchema:(unsigned int *)a3
{
  *a3 = 26;
  return &unk_26D336848;
}

+ (id)mockMigrationsByAddingQueries:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [v5 migrations];
  v7 = (void *)[v6 mutableCopy];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "maxVersion") + 1);
  [v7 setObject:v4 forKeyedSubscript:v8];

  objc_super v9 = (void *)[objc_alloc((Class)a1) initWithMigrations:v7];
  return v9;
}

@end