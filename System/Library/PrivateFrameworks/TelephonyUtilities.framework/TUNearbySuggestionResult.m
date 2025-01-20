@interface TUNearbySuggestionResult
+ (BOOL)supportsSecureCoding;
- (TUConversationActivity)selectedActivity;
- (TUNearbySuggestion)suggestion;
- (TUNearbySuggestionResult)initWithCoder:(id)a3;
- (TUNearbySuggestionResult)initWithSuggestion:(id)a3 selectedActivity:(id)a4 type:(int64_t)a5;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbySuggestionResult

- (TUNearbySuggestionResult)initWithSuggestion:(id)a3 selectedActivity:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUNearbySuggestionResult;
  v11 = [(TUNearbySuggestionResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestion, a3);
    objc_storeStrong((id *)&v12->_selectedActivity, a4);
    v12->_type = a5;
  }

  return v12;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" suggestion=%@", self->_suggestion];
  [v6 appendFormat:@" selectedActivity=%@", self->_selectedActivity];
  unint64_t v7 = self->_type - 1;
  if (v7 > 2) {
    v8 = @"cancelled";
  }
  else {
    v8 = off_1E58E6F00[v7];
  }
  [v6 appendFormat:@" type=%@", v8];
  [v6 appendString:@">"];
  id v9 = (void *)[v6 copy];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_suggestion);
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_selectedActivity);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = NSStringFromSelector(sel_type);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  v13 = [(TUNearbySuggestionResult *)self initWithSuggestion:v7 selectedActivity:v10 type:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_suggestion);
  [v5 encodeObject:suggestion forKey:v6];

  selectedActivity = self->_selectedActivity;
  uint64_t v8 = NSStringFromSelector(sel_selectedActivity);
  [v5 encodeObject:selectedActivity forKey:v8];

  int64_t type = self->_type;
  NSStringFromSelector(sel_type);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:type forKey:v10];
}

- (TUNearbySuggestion)suggestion
{
  return self->_suggestion;
}

- (TUConversationActivity)selectedActivity
{
  return self->_selectedActivity;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActivity, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end