@interface NTKGreenfieldPlaceholderComplication
+ (BOOL)supportsSecureCoding;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)placeholderWithComplication:(id)a3;
+ (id)placeholderWithComplication:(id)a3 appStoreItemId:(id)a4 appName:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (NSNumber)appStoreItemId;
- (NSString)appName;
- (NTKComplication)complication;
- (NTKGreenfieldPlaceholderComplication)initWithCoder:(id)a3;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)appIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedDetailText;
- (id)localizedKeylineLabelText;
- (id)localizedRichDetailText;
- (id)localizedRichKeylineLabelText;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKGreenfieldPlaceholderComplication

+ (id)placeholderWithComplication:(id)a3 appStoreItemId:(id)a4 appName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithComplicationType:55];
  v12 = (void *)v11[5];
  v11[5] = v9;
  id v13 = v9;

  v14 = (void *)v11[4];
  v11[4] = v8;
  id v15 = v8;

  v16 = (void *)v11[6];
  v11[6] = v10;
  id v17 = v10;

  uint64_t v18 = [v11 _generateUniqueIdentifier];
  v19 = (void *)v11[1];
  v11[1] = v18;

  return v11;
}

+ (id)placeholderWithComplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithComplicationType:55];
  v6 = (void *)v5[4];
  v5[4] = v4;
  id v7 = v4;

  uint64_t v8 = [v5 _generateUniqueIdentifier];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Greenfield placeholder of itemId: %@ complication: %@", self->_appStoreItemId, self->_complication];
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return 1;
}

- (id)_generateUniqueIdentifier
{
  v2 = NSString;
  v3 = [(NTKComplication *)self->_complication uniqueIdentifier];
  id v4 = [v2 stringWithFormat:@"greenfieldPlaceholder-%@", v3];

  return v4;
}

- (id)appIdentifier
{
  return [(NTKComplication *)self->_complication appIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKGreenfieldPlaceholderComplication;
    BOOL v5 = [(NTKComplication *)&v7 isEqual:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  id v4 = [(NTKComplication *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_complication);
  objc_storeStrong(v4 + 5, self->_appStoreItemId);
  objc_storeStrong(v4 + 6, self->_appName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKGreenfieldPlaceholderComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  BOOL v5 = [(NTKComplication *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"];
    appStoreItemId = v5->_appStoreItemId;
    v5->_appStoreItemId = (NSNumber *)v6;

    if (!v5->_appStoreItemId) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ appStoreItemId must not be nil", objc_opt_class() format];
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationGreenfieldPlaceholderComplicationKey"];
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v8;

    if (!v5->_complication) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil complication", objc_opt_class() format];
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationGreenfieldPlaceholderAppNameKey"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v10;

    if (!v5->_appName) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ app name must not be nil", objc_opt_class() format];
    }
    uint64_t v12 = [(NTKGreenfieldPlaceholderComplication *)v5 _generateUniqueIdentifier];
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  id v4 = a3;
  [(NTKComplication *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_complication, @"_ComplicationGreenfieldPlaceholderComplicationKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_appStoreItemId forKey:@"_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"];
  [v4 encodeObject:self->_appName forKey:@"_ComplicationGreenfieldPlaceholderAppNameKey"];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  id v4 = a3;
  [(NTKComplication *)&v6 _addKeysToJSONDictionary:v4];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_appStoreItemId, @"_ComplicationGreenfieldPlaceholderAppStoreItemIdKey", v6.receiver, v6.super_class);
  [v4 setObject:self->_appName forKeyedSubscript:@"_ComplicationGreenfieldPlaceholderAppNameKey"];
  objc_super v5 = [(NTKComplication *)self->_complication JSONObjectRepresentation];
  [v4 setObject:v5 forKeyedSubscript:@"_ComplicationGreenfieldPlaceholderComplicationKey"];
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  objc_super v7 = [(NTKComplication *)&v16 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"];
    id v9 = (void *)v7[5];
    v7[5] = v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"_ComplicationGreenfieldPlaceholderAppNameKey"];
    v11 = (void *)v7[6];
    v7[6] = v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"_ComplicationGreenfieldPlaceholderComplicationKey"];
    uint64_t v13 = +[NTKComplication complicationWithJSONObjectRepresentation:v12];
    v14 = (void *)v7[4];
    v7[4] = v13;
  }
  return v7;
}

- (id)localizedDetailText
{
  return self->_appName;
}

- (id)localizedKeylineLabelText
{
  return self->_appName;
}

- (id)localizedRichDetailText
{
  return self->_appName;
}

- (id)localizedRichKeylineLabelText
{
  return self->_appName;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NSNumber)appStoreItemId
{
  return self->_appStoreItemId;
}

- (NSString)appName
{
  return self->_appName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appStoreItemId, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

@end