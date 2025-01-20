@interface ICRadioTrackInfoContentReference
+ (BOOL)supportsSecureCoding;
- (ICRadioTrackInfoContentReference)initWithCoder:(id)a3;
- (ICRadioTrackInfoContentReference)initWithStoreIdentifier:(id)a3 trackInfo:(id)a4;
- (NSDictionary)trackInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICRadioTrackInfoContentReference

- (void).cxx_destruct
{
}

- (NSDictionary)trackInfo
{
  return self->_trackInfo;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioTrackInfoContentReference;
  id v4 = a3;
  [(ICRadioStoreContentReference *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackInfo, @"trackInfo", v5.receiver, v5.super_class);
}

- (ICRadioTrackInfoContentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioTrackInfoContentReference;
  objc_super v5 = [(ICRadioStoreContentReference *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"trackInfo"];
    trackInfo = v5->_trackInfo;
    v5->_trackInfo = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICRadioTrackInfoContentReference;
  objc_super v5 = -[ICRadioStoreContentReference copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSDictionary *)self->_trackInfo copyWithZone:a3];
    v7 = (void *)v5[3];
    v5[3] = v6;
  }
  return v5;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICRadioTrackInfoContentReference;
  id v4 = [(ICRadioStoreContentReference *)&v8 rawContentDictionaryWithSubscriptionStatus:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  [v5 setObject:self->_trackInfo forKeyedSubscript:@"track-info"];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICRadioStoreContentReference *)self storeIdentifier];
  objc_super v5 = [(ICRadioTrackInfoContentReference *)self trackInfo];
  uint64_t v6 = [v3 stringWithFormat:@"<ICRadioTrackInfoContentReference: %p adamID=%@> trackInfo=%@", self, v4, v5];

  return v6;
}

- (ICRadioTrackInfoContentReference)initWithStoreIdentifier:(id)a3 trackInfo:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICRadioTrackInfoContentReference;
  v7 = [(ICRadioStoreContentReference *)&v11 initWithStoreIdentifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    trackInfo = v7->_trackInfo;
    v7->_trackInfo = (NSDictionary *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end