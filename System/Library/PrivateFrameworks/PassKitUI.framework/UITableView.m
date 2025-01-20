@interface UITableView
@end

@implementation UITableView

uint64_t __75__UITableView_PKUIUtilities__pkui_groupedStyleDefaultRoundedCornerBehavior__block_invoke(uint64_t a1)
{
  if (qword_1EB545B48 != -1) {
    dispatch_once(&qword_1EB545B48, &__block_literal_global_46);
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "pkui_groupedStyleWithRoundedCorners:", (qword_1EB545B40 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  pkui_groupedStyleDefaultRoundedCornerBehavior_groupedStyle = result;
  return result;
}

@end