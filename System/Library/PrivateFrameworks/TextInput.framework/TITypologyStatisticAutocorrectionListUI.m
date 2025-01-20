@interface TITypologyStatisticAutocorrectionListUI
- (id)structuredReport;
- (int64_t)displayedToHidden;
- (int64_t)hiddenToDisplayed;
- (int64_t)inputsWhileDisplayed;
- (int64_t)inputsWhileHidden;
- (void)addInputCount;
- (void)setListUIDisplayed:(BOOL)a3;
- (void)visitRecordAutocorrections:(id)a3;
- (void)visitRecordSync:(id)a3;
@end

@implementation TITypologyStatisticAutocorrectionListUI

- (int64_t)displayedToHidden
{
  return self->_displayedToHidden;
}

- (int64_t)hiddenToDisplayed
{
  return self->_hiddenToDisplayed;
}

- (int64_t)inputsWhileDisplayed
{
  return self->_inputsWhileDisplayed;
}

- (int64_t)inputsWhileHidden
{
  return self->_inputsWhileHidden;
}

- (void)visitRecordAutocorrections:(id)a3
{
  uint64_t v4 = [a3 listUIDisplayed];

  [(TITypologyStatisticAutocorrectionListUI *)self setListUIDisplayed:v4];
}

- (void)visitRecordSync:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 keyboardState];

  if (v4)
  {
    v5 = [v6 keyboardState];
    -[TITypologyStatisticAutocorrectionListUI setListUIDisplayed:](self, "setListUIDisplayed:", [v5 autocorrectionListUIDisplayed]);
  }
}

- (void)setListUIDisplayed:(BOOL)a3
{
  if (self->_didSetListUIDisplayed)
  {
    if (!self->_listUIDisplayed && a3)
    {
      v3 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__hiddenToDisplayed;
LABEL_8:
      ++*(Class *)((char *)&self->super.super.isa + *v3);
      goto LABEL_9;
    }
    if (self->_listUIDisplayed && !a3)
    {
      v3 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__displayedToHidden;
      goto LABEL_8;
    }
  }
LABEL_9:
  self->_didSetListUIDisplayed = 1;
  self->_listUIDisplayed = a3;
}

- (void)addInputCount
{
  if (self->_listUIDisplayed) {
    v2 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__inputsWhileDisplayed;
  }
  else {
    v2 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__inputsWhileHidden;
  }
  ++*(Class *)((char *)&self->super.super.isa + *v2);
}

- (id)structuredReport
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"ListUI Inputs While Hidden";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI inputsWhileHidden](self, "inputsWhileHidden"));
  v10[0] = v3;
  v9[1] = @"ListUI Inputs While Displayed";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI inputsWhileDisplayed](self, "inputsWhileDisplayed"));
  v10[1] = v4;
  v9[2] = @"ListUI Hidden To Displayed";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI hiddenToDisplayed](self, "hiddenToDisplayed"));
  v10[2] = v5;
  v9[3] = @"ListUI Displayed To Hidden";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI displayedToHidden](self, "displayedToHidden"));
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

@end