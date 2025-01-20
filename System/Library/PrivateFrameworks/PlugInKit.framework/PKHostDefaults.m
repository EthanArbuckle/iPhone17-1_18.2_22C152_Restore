@interface PKHostDefaults
- (BOOL)synchronize;
- (PKHostDefaults)initWithPlugIn:(id)a3;
- (PKHostPlugIn)plugin;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPlugin:(id)a3;
@end

@implementation PKHostDefaults

- (PKHostDefaults)initWithPlugIn:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKHostDefaults;
  v5 = [(PKHostDefaults *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKHostDefaults *)v5 setPlugin:v4];
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1B38B78BC;
  v16 = sub_1B38B787C;
  id v17 = 0;
  v5 = [(PKHostDefaults *)self plugin];
  v6 = [v5 syncService];
  v7 = [(PKHostDefaults *)self plugin];
  objc_super v8 = [v7 identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B38CB448;
  v11[3] = &unk_1E60594F0;
  v11[4] = &v12;
  [v6 prefsObjectForKey:v4 inPlugIn:v8 result:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(PKHostDefaults *)self plugin];
  objc_super v8 = [v11 syncService];
  id v9 = [(PKHostDefaults *)self plugin];
  v10 = [v9 identifier];
  [v8 prefsSetObject:v7 forKey:v6 inPlugIn:v10 result:&unk_1F0C154B0];
}

- (BOOL)synchronize
{
  return 1;
}

- (PKHostPlugIn)plugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  return (PKHostPlugIn *)WeakRetained;
}

- (void)setPlugin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end