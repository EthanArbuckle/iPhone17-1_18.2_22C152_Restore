@interface COSResumePairingState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSavedValueForClassName:(id)a3;
- (BOOL)isTinkerPairing;
- (COSResumePairingState)init;
- (COSResumePairingState)initWithCoder:(id)a3;
- (NSDate)pairingStartedDate;
- (NSMutableDictionary)savedValues;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateSavedValuesUsingBlock:(id)a3;
- (void)saveValue:(id)a3 forPaneClassName:(id)a4;
- (void)setIsTinkerPairing:(BOOL)a3;
- (void)setPairingStartedDate:(id)a3;
- (void)setSavedValues:(id)a3;
@end

@implementation COSResumePairingState

- (COSResumePairingState)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSResumePairingState;
  v2 = [(COSResumePairingState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    savedValues = v2->_savedValues;
    v2->_savedValues = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  pairingStartedDate = self->_pairingStartedDate;
  id v5 = a3;
  [v5 encodeObject:pairingStartedDate forKey:@"pairingStartedDate"];
  [v5 encodeBool:self->_isTinkerPairing forKey:@"isTinkerPairing"];
  [v5 encodeObject:self->_savedValues forKey:@"savedValues"];
}

- (COSResumePairingState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSResumePairingState;
  id v5 = [(COSResumePairingState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingStartedDate"];
    pairingStartedDate = v5->_pairingStartedDate;
    v5->_pairingStartedDate = (NSDate *)v6;

    v5->_isTinkerPairing = [v4 decodeBoolForKey:@"isTinkerPairing"];
    uint64_t v8 = objc_opt_class();
    v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"savedValues"];
    v10 = (NSMutableDictionary *)[v9 mutableCopy];
    savedValues = v5->_savedValues;
    v5->_savedValues = v10;
  }
  return v5;
}

- (void)saveValue:(id)a3 forPaneClassName:(id)a4
{
}

- (void)enumerateSavedValuesUsingBlock:(id)a3
{
  id v4 = a3;
  savedValues = self->_savedValues;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BA3C;
  v7[3] = &unk_100243E58;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)savedValues enumerateKeysAndObjectsUsingBlock:v7];
}

- (BOOL)hasSavedValueForClassName:(id)a3
{
  savedValues = self->_savedValues;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)savedValues allKeys];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSDate)pairingStartedDate
{
  return self->_pairingStartedDate;
}

- (void)setPairingStartedDate:(id)a3
{
}

- (BOOL)isTinkerPairing
{
  return self->_isTinkerPairing;
}

- (void)setIsTinkerPairing:(BOOL)a3
{
  self->_isTinkerPairing = a3;
}

- (NSMutableDictionary)savedValues
{
  return self->_savedValues;
}

- (void)setSavedValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedValues, 0);

  objc_storeStrong((id *)&self->_pairingStartedDate, 0);
}

@end