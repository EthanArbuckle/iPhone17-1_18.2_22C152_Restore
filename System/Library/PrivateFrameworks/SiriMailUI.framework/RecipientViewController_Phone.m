@interface RecipientViewController_Phone
- (BOOL)_canShowWhileLocked;
- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithCoder:(id)a3;
- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithNibName:(id)a3 bundle:(id)a4;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (void)autocompleteResultsController:(id)a3 didExpandSelectedRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)finishedSearchingForAutocompleteResults;
- (void)recipientViewDidBecomeFirstResponder:(id)a3;
- (void)recipientViewDidResignFirstResponder:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RecipientViewController_Phone

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25CF23728();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25CF23898();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_25CF2443C();
}

- (_TtC10SiriMailUI29RecipientViewController_Phone)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_25CF43D88();
  }
  id v5 = a4;
  sub_25CF24768();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_7_5();
  uint64_t v3 = v2;

  v4 = *(void **)(v3 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 88);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_2();
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25CF24938();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25CF24A48((uint64_t)v8, v7);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25CF24CE0((uint64_t)v8, v7);
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = self;
  sub_25CF24F20();
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25CF250D4();
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25CF250D4();
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_25CF43D88();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_25CF25394(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_25CF43D88();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  id v11 = sub_25CF25490((uint64_t)v10, v6, v8);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  if (a4) {
    sub_25CF43D88();
  }
  id v6 = a3;
  uint64_t v7 = self;
  sub_25CF2557C();

  swift_bridgeObjectRelease();
}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25CF25A20((uint64_t)v5, MEMORY[0x263F77948]);
}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25CF25A20((uint64_t)v5, MEMORY[0x263F77940]);
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25CF25B44();
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  if (a3) {
    uint64_t v6 = sub_25CF43DE8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a4;
  uint64_t v8 = self;
  sub_25CF25D88(v6);

  swift_bridgeObjectRelease();
}

- (void)finishedSearchingForAutocompleteResults
{
  uint64_t v2 = self;
  sub_25CF25F94();
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_25CF2602C((uint64_t)v9, (uint64_t)v8);
}

- (void)autocompleteResultsController:(id)a3 didExpandSelectedRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_25CF26180();
}

@end