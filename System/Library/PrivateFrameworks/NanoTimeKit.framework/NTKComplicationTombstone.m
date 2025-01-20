@interface NTKComplicationTombstone
+ (BOOL)supportsSecureCoding;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)tombstoneWithComplication:(id)a3;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (NTKComplication)complication;
- (NTKComplicationTombstone)initWithCoder:(id)a3;
- (id)_generateUniqueIdentifier;
- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4;
- (id)appIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)uniqueIdentifier;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationTombstone

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  id v6 = a4;
  v7 = [(NTKComplicationTombstone *)self complication];
  v8 = [v7 _migrateToFamily:a3 withAllowedComplications:v6];

  return v8;
}

+ (id)tombstoneWithComplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithComplicationType:0];
  id v6 = (void *)v5[5];
  v5[5] = v4;
  id v7 = v4;

  uint64_t v8 = [v5 _generateUniqueIdentifier];
  v9 = (void *)v5[4];
  v5[4] = v8;

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Tombstone of %@", self->_complication];
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return [(NTKComplication *)self->_complication supportsComplicationFamily:a3 forDevice:a4];
}

- (id)_generateUniqueIdentifier
{
  v2 = NSString;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  id v4 = [v3 stringValue];
  v5 = [v2 stringWithFormat:@"tombstone-%@", v4];

  return v5;
}

- (id)appIdentifier
{
  return [(NTKComplication *)self->_complication appIdentifier];
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationTombstone;
  id v4 = [(NTKComplication *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 5, self->_complication);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationTombstone)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKComplicationTombstone;
  v5 = [(NTKComplication *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ComplicationTombstoneComplicationKey"];
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v6;

    if (!v5->_complication) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil complication", objc_opt_class() format];
    }
    uint64_t v8 = [(NTKComplicationTombstone *)v5 _generateUniqueIdentifier];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKComplicationTombstone;
  id v4 = a3;
  [(NTKComplication *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_complication, @"ComplicationTombstoneComplicationKey", v5.receiver, v5.super_class);
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationTombstone;
  id v4 = a3;
  [(NTKComplication *)&v6 _addKeysToJSONDictionary:v4];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC28], @"available", v6.receiver, v6.super_class);
  objc_super v5 = [(NTKComplication *)self->_complication JSONObjectRepresentation];
  [v4 addEntriesFromDictionary:v5];
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end