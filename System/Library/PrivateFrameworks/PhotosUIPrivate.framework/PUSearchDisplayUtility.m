@interface PUSearchDisplayUtility
+ (BOOL)hasLimitedScreenSize;
+ (BOOL)indexPathIsFirstRowInSection:(id)a3 tableView:(id)a4;
+ (BOOL)indexPathIsLastRowInSection:(id)a3 tableView:(id)a4;
+ (id)applyCornerMaskToCell:(id)a3 roundedCornerType:(int64_t)a4;
+ (id)genericCellFromCell:(id)a3 roundedCornerType:(int64_t)a4;
+ (id)genericSuggestionsCellFont;
+ (id)genericSuggestionsTitleCellFont;
+ (unint64_t)cornerMaskForCell:(id)a3 roundedCornerType:(int64_t)a4;
@end

@implementation PUSearchDisplayUtility

+ (BOOL)hasLimitedScreenSize
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = *MEMORY[0x1E4F90F18];
  if (v4 == *MEMORY[0x1E4F90F20] && v6 == v7) {
    return 1;
  }
  if (v4 == v7) {
    return v6 == *MEMORY[0x1E4F90F20];
  }
  return 0;
}

+ (BOOL)indexPathIsFirstRowInSection:(id)a3 tableView:(id)a4
{
  return [a3 row] == 0;
}

+ (BOOL)indexPathIsLastRowInSection:(id)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

  uint64_t v8 = [v6 row];
  return v8 == v7 - 1;
}

+ (id)genericSuggestionsTitleCellFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  double v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  double v4 = objc_msgSend(v3, "boldSystemFontOfSize:");

  return v4;
}

+ (id)genericSuggestionsCellFont
{
  v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  double v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  double v4 = objc_msgSend(v3, "systemFontOfSize:");

  return v4;
}

+ (id)genericCellFromCell:(id)a3 roundedCornerType:(int64_t)a4
{
  double v4 = +[PUSearchDisplayUtility applyCornerMaskToCell:a3 roundedCornerType:a4];
  objc_msgSend(v4, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  [v4 setSeparatorStyle:1];
  return v4;
}

+ (id)applyCornerMaskToCell:(id)a3 roundedCornerType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = +[PUSearchDisplayUtility cornerMaskForCell:v5 roundedCornerType:a4];
  if (v6) {
    double v7 = 5.0;
  }
  else {
    double v7 = 0.0;
  }
  uint64_t v8 = [v5 layer];
  [v8 setCornerRadius:v7];

  v9 = [v5 layer];
  [v9 setMaskedCorners:v6];

  v10 = [v5 layer];
  [v10 setMasksToBounds:1];

  return v5;
}

+ (unint64_t)cornerMaskForCell:(id)a3 roundedCornerType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1AEFF8530[a4 - 1];
  }
}

@end