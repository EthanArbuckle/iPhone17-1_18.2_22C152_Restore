@interface SearchUIWatchListButtonItem
- (id)commandForStatus:(unint64_t)a3;
- (id)offStateSymbolName;
- (id)onStateSymbolName;
- (id)toggledTitle;
- (id)untoggledTitle;
@end

@implementation SearchUIWatchListButtonItem

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"ADD_TO_UP_NEXT"];
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"IN_UP_NEXT"];
}

- (id)offStateSymbolName
{
  return @"plus";
}

- (id)onStateSymbolName
{
  return @"checkmark";
}

- (id)commandForStatus:(unint64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(SearchUIButtonItem *)self sfButtonItem];
  v7 = [v6 watchListItem];
  [v5 setWatchListItem:v7];

  [v5 setShouldAddToWatchList:a3 == 0];
  return v5;
}

@end