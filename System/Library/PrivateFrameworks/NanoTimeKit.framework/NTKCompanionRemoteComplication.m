@interface NTKCompanionRemoteComplication
+ (id)complicationWithApp:(id)a3;
- (NTKCompanion3rdPartyApp)app;
- (id)localizedDetailText;
- (void)setApp:(id)a3;
@end

@implementation NTKCompanionRemoteComplication

+ (id)complicationWithApp:(id)a3
{
  id v4 = a3;
  v5 = [v4 complicationClientIdentifier];
  v6 = self;
  v7 = [v6 watchApplicationIdentifier];
  v8 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
  v9 = [a1 complicationWithClientIdentifier:v5 appBundleIdentifier:v7 complicationDescriptor:v8];

  [v9 setApp:v4];

  return v9;
}

- (id)localizedDetailText
{
  v3 = [(NTKCompanionRemoteComplication *)self app];

  if (v3)
  {
    id v4 = [(NTKCompanionRemoteComplication *)self app];
    v5 = [v4 name];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKCompanionRemoteComplication;
    v5 = [(NTKRemoteComplication *)&v7 localizedDetailText];
  }

  return v5;
}

- (NTKCompanion3rdPartyApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end