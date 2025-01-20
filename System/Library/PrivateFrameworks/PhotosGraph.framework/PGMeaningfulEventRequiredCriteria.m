@interface PGMeaningfulEventRequiredCriteria
- (BOOL)mustBeInteresting;
- (NSDictionary)additionalInfo;
- (NSMutableDictionary)internalAdditionalInfo;
- (NSString)identifier;
- (NSString)meaningNodeLabel;
- (PGMeaningfulEventRequiredCriteria)initWithIdentifier:(id)a3 minimumScore:(double)a4 graph:(id)a5;
- (double)minimumScore;
- (id)debugDescription;
- (id)description;
- (void)setAdditionalInfoForKey:(id)a3 value:(id)a4;
- (void)setInternalAdditionalInfo:(id)a3;
- (void)setMustBeInteresting:(BOOL)a3;
@end

@implementation PGMeaningfulEventRequiredCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAdditionalInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setInternalAdditionalInfo:(id)a3
{
}

- (NSMutableDictionary)internalAdditionalInfo
{
  return self->_internalAdditionalInfo;
}

- (void)setMustBeInteresting:(BOOL)a3
{
  self->_mustBeInteresting = a3;
}

- (BOOL)mustBeInteresting
{
  return self->_mustBeInteresting;
}

- (double)minimumScore
{
  return self->_minimumScore;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)self->_internalAdditionalInfo;
}

- (void)setAdditionalInfoForKey:(id)a3 value:(id)a4
{
}

- (id)debugDescription
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  v4 = [(PGMeaningfulEventRequiredCriteria *)&v10 description];
  identifier = self->_identifier;
  double minimumScore = self->_minimumScore;
  v7 = [(PGMeaningfulEventCriteria *)self _debugDescriptionWithMomentNode:0];
  v8 = [v3 stringWithFormat:@"%@ %@, %.2f, %@", v4, identifier, *(void *)&minimumScore, v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  v4 = [(PGMeaningfulEventRequiredCriteria *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@, %.2f", v4, self->_identifier, *(void *)&self->_minimumScore];

  return v5;
}

- (NSString)meaningNodeLabel
{
  v2 = [(PGMeaningfulEventRequiredCriteria *)self identifier];
  if ([(__CFString *)v2 isEqualToString:@"WeakBirthday"])
  {
    v3 = @"Birthday";

    v2 = @"Birthday";
  }
  return (NSString *)v2;
}

- (PGMeaningfulEventRequiredCriteria)initWithIdentifier:(id)a3 minimumScore:(double)a4 graph:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  objc_super v10 = [(PGMeaningfulEventCriteria *)&v15 initWithGraph:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v11->_double minimumScore = a4;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    internalAdditionalInfo = v11->_internalAdditionalInfo;
    v11->_internalAdditionalInfo = v12;
  }
  return v11;
}

@end