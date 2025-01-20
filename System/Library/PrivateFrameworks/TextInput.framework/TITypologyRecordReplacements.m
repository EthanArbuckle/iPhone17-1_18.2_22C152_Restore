@interface TITypologyRecordReplacements
+ (BOOL)supportsSecureCoding;
- (NSArray)candidates;
- (NSString)string;
- (TIKeyboardLayout)keyLayout;
- (TITypologyRecordReplacements)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setKeyLayout:(id)a3;
- (void)setString:(id)a3;
@end

@implementation TITypologyRecordReplacements

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setKeyLayout:(id)a3
{
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(TITypologyRecordReplacements *)self string];
  v5 = [(TITypologyRecordReplacements *)self candidates];
  v6 = [v3 stringWithFormat:@"REPLACEMENTS for \"%@\": %@", v4, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordReplacements;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_string, @"string", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyLayout forKey:@"keyLayout"];
  [v4 encodeObject:self->_candidates forKey:@"candidates"];
}

- (TITypologyRecordReplacements)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TITypologyRecordReplacements;
  objc_super v5 = [(TITypologyRecord *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    uint64_t v7 = [v6 copy];
    string = v5->_string;
    v5->_string = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyLayout"];
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"candidates"];
    candidates = v5->_candidates;
    v5->_candidates = (NSArray *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end