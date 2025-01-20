@interface DOCGoToSuggestionsViewController.SuggestionCell
- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithCoder:(id)a3;
- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10050F27C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell *)sub_10050F6E8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell *)sub_10050F778(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end