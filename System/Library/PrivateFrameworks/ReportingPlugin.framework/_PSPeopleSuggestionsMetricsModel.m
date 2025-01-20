@interface _PSPeopleSuggestionsMetricsModel
- (_PSPeopleSuggestionsMetricsModel)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4;
- (_PSPeopleSuggestionsMetricsModel)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4;
- (_PSPeopleSuggestionsMetricsModelInternal)underlyingObject;
@end

@implementation _PSPeopleSuggestionsMetricsModel

- (_PSPeopleSuggestionsMetricsModel)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_PSPeopleSuggestionsMetricsModel;
  id v5 = a4;
  v6 = [(_PSPeopleSuggestionsMetricsModel *)&v12 init];
  v7 = [_PSPeopleSuggestionsMetricsModelInternal alloc];
  v8 = objc_msgSend(v5, "underlyingObject", v12.receiver, v12.super_class);

  uint64_t v9 = [(_PSPeopleSuggestionsMetricsModelInternal *)v7 initWithModelType:a3 trialIdentifier:v8];
  underlyingObject = v6->_underlyingObject;
  v6->_underlyingObject = (_PSPeopleSuggestionsMetricsModelInternal *)v9;

  return v6;
}

- (_PSPeopleSuggestionsMetricsModel)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_PSPeopleSuggestionsMetricsModel;
  id v5 = a4;
  id v6 = a3;
  v7 = [(_PSPeopleSuggestionsMetricsModel *)&v13 init];
  v8 = [_PSPeopleSuggestionsMetricsModelInternal alloc];
  uint64_t v9 = objc_msgSend(v5, "underlyingObject", v13.receiver, v13.super_class);

  uint64_t v10 = [(_PSPeopleSuggestionsMetricsModelInternal *)v8 initWithModelIdentifier:v6 trialIdentifier:v9];
  underlyingObject = v7->_underlyingObject;
  v7->_underlyingObject = (_PSPeopleSuggestionsMetricsModelInternal *)v10;

  return v7;
}

- (_PSPeopleSuggestionsMetricsModelInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsModelInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end