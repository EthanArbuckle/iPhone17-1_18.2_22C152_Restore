@interface MFSearchSuggestionAtom
- (MUISearchScopedSuggestion)suggestion;
- (NSString)displayName;
- (NSString)editingString;
- (id)description;
@end

@implementation MFSearchSuggestionAtom

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_suggestion];
}

- (NSString)displayName
{
  return (NSString *)[(MUISearchScopedSuggestion *)self->_suggestion atomTitle];
}

- (MUISearchScopedSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)editingString
{
  return self->_editingString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingString, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end