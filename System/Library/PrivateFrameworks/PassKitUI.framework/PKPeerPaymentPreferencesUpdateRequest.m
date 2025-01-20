@interface PKPeerPaymentPreferencesUpdateRequest
- (NSSet)sections;
- (PKPeerPaymentPreferences)updatedPreferences;
- (PKPeerPaymentPreferencesUpdateRequest)initWithUpdatedPreferences:(id)a3 section:(int64_t)a4;
- (id)description;
- (void)coalesceWithRequest:(id)a3;
@end

@implementation PKPeerPaymentPreferencesUpdateRequest

- (PKPeerPaymentPreferencesUpdateRequest)initWithUpdatedPreferences:(id)a3 section:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentPreferencesUpdateRequest;
  v8 = [(PKPeerPaymentPreferencesUpdateRequest *)&v14 init];
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    sections = v8->_sections;
    v8->_sections = v9;

    v11 = v8->_sections;
    v12 = [NSNumber numberWithInteger:a4];
    [(NSMutableSet *)v11 addObject:v12];

    objc_storeStrong((id *)&v8->_updatedPreferences, a3);
  }

  return v8;
}

- (void)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 updatedPreferences];
  updatedPreferences = self->_updatedPreferences;
  self->_updatedPreferences = v5;

  sections = self->_sections;
  id v8 = [v4 sections];

  [(NSMutableSet *)sections unionSet:v8];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"updatedPreferences: '%@'; ", self->_updatedPreferences];
  [v3 appendFormat:@">"];

  return v3;
}

- (PKPeerPaymentPreferences)updatedPreferences
{
  return self->_updatedPreferences;
}

- (NSSet)sections
{
  return &self->_sections->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedPreferences, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end