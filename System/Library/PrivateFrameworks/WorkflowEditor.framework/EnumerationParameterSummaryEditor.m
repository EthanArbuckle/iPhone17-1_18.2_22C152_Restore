@interface EnumerationParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (_TtC14WorkflowEditor33EnumerationParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)completeEditing;
@end

@implementation EnumerationParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_234AE9874(v8, v6);
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  unint64_t v7 = sub_234AE9ECC();

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BE0);
    id v8 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_234AEAA54((uint64_t)v5);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D8198, v5);
}

- (void)completeEditing
{
  v2 = self;
  sub_234AEB2C4();
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return sub_234AEBFE4();
}

- (_TtC14WorkflowEditor33EnumerationParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor33EnumerationParameterSummaryEditor *)sub_234AEC040(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker));
}

@end