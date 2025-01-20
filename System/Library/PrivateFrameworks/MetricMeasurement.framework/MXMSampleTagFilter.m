@interface MXMSampleTagFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)finite;
- (BOOL)matchesSampleWithTag:(id)a3;
- (MXMSampleTagFilter)initWithCoder:(id)a3;
- (MXMSampleTagFilter)initWithTag:(id)a3 allowDescendents:(BOOL)a4;
- (NSSet)tagPermutations;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTagPermutations:(id)a3;
@end

@implementation MXMSampleTagFilter

- (MXMSampleTagFilter)initWithTag:(id)a3 allowDescendents:(BOOL)a4
{
  v6 = [a3 domainNameString];
  v9.receiver = self;
  v9.super_class = (Class)MXMSampleTagFilter;
  v7 = [(MXMSampleTag *)&v9 initWithDNString:v6];

  if (v7) {
    v7->_allowDescendents = a4;
  }
  return v7;
}

- (BOOL)matchesSampleWithTag:(id)a3
{
  id v4 = a3;
  if ([(MXMSampleTag *)self isEqualToTag:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_allowDescendents && [(MXMSampleTag *)self containsTag:v4];
  }

  return v5;
}

- (BOOL)finite
{
  return 1;
}

- (id)copy
{
  return [(MXMSampleTagFilter *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MXMSampleTagFilter alloc];
  BOOL allowDescendents = self->_allowDescendents;
  return [(MXMSampleTagFilter *)v4 initWithTag:self allowDescendents:allowDescendents];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXMSampleTagFilter;
  id v4 = a3;
  [(MXMSampleTag *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowDescendents, @"_allowDescendents", v5.receiver, v5.super_class);
}

- (MXMSampleTagFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MXMSampleTagFilter;
  objc_super v5 = [(MXMSampleTag *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_BOOL allowDescendents = [v4 decodeBoolForKey:@"_allowDescendents"];
  }

  return v5;
}

- (NSSet)tagPermutations
{
  return self->_tagPermutations;
}

- (void)setTagPermutations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end