@interface ICOutlineController
- (BOOL)canCollapseAnyUUIDs:(id)a3;
- (BOOL)canExpandAnyUUIDs:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isUUIDCollapsed:(id)a3;
- (BOOL)isUUIDCollapsible:(id)a3;
- (BOOL)isUUIDHidden:(id)a3;
- (BOOL)toggleCollapsedAtRange:(_NSRange)a3;
- (ICOutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5;
- (ICTTTextStorage)textStorage;
- (NSArray)invisibleRangeValues;
- (NSArray)rangesValuesContainingCollapsedRanges;
- (NSArray)rangesValuesContainingExpandedRanges;
- (NSArray)visibleRangeValues;
- (NSAttributedString)visibleAttributedText;
- (NSSet)collapsedUUIDs;
- (OutlineController)outlineControllerObject;
- (_NSRange)descendantRangeForUUID:(id)a3;
- (_NSRange)rangeForUUID:(id)a3;
- (_NSRange)visibleRange;
- (id)ancestorsForUUID:(id)a3;
- (id)closestVisibleAncestorForUUID:(id)a3;
- (id)descendantsForUUID:(id)a3;
- (int64_t)collapsibleSectionAffordanceUsages;
- (void)collapseAll;
- (void)collapseUUIDs:(id)a3;
- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3;
- (void)expandAll;
- (void)expandAncestorsOfRange:(_NSRange)a3;
- (void)expandUUIDs:(id)a3;
- (void)requestUpdate;
- (void)resetCollapsibleSectionAffordanceUsages;
- (void)setCollapsedUUIDs:(id)a3;
- (void)setIsAsynchronous:(BOOL)a3;
- (void)setOutlineControllerObject:(id)a3;
- (void)toggleUUIDCollapsed:(id)a3;
@end

@implementation ICOutlineController

- (ICOutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICOutlineController;
  v10 = [(ICOutlineController *)&v14 init];
  if (v10)
  {
    v11 = [[OutlineController alloc] initWithTextStorage:v8 collapsedUUIDs:v9 asynchronous:v5];
    outlineControllerObject = v10->_outlineControllerObject;
    v10->_outlineControllerObject = v11;
  }
  return v10;
}

- (BOOL)isUUIDCollapsed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICOutlineController *)self outlineControllerObject];
  char v6 = [v5 isUUIDCollapsed:v4];

  return v6;
}

- (BOOL)isUUIDCollapsible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICOutlineController *)self outlineControllerObject];
  char v6 = [v5 isUUIDCollapsible:v4];

  return v6;
}

- (BOOL)isUUIDHidden:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICOutlineController *)self outlineControllerObject];
  char v6 = [v5 isUUIDHidden:v4];

  return v6;
}

- (OutlineController)outlineControllerObject
{
  return self->_outlineControllerObject;
}

- (NSSet)collapsedUUIDs
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  v3 = [v2 collapsedUUIDs];

  return (NSSet *)v3;
}

- (ICTTTextStorage)textStorage
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  v3 = [v2 textStorage];

  return (ICTTTextStorage *)v3;
}

- (BOOL)isAsynchronous
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  char v3 = [v2 isAsynchronous];

  return v3;
}

- (void)setIsAsynchronous:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICOutlineController *)self outlineControllerObject];
  [v4 setIsAsynchronous:v3];
}

- (void)setCollapsedUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  [v5 setCollapsedUUIDs:v4];
}

- (int64_t)collapsibleSectionAffordanceUsages
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  BOOL v3 = [v2 interactedUUIDs];
  int64_t v4 = [v3 count];

  return v4;
}

- (_NSRange)visibleRange
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 visibleRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSArray)visibleRangeValues
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 visibleRangeValues];

  return (NSArray *)v3;
}

- (NSArray)invisibleRangeValues
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 invisibleRangeValues];

  return (NSArray *)v3;
}

- (NSArray)rangesValuesContainingCollapsedRanges
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 rangesValuesContainingCollapsedRanges];

  return (NSArray *)v3;
}

- (NSArray)rangesValuesContainingExpandedRanges
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 rangesValuesContainingExpandedRanges];

  return (NSArray *)v3;
}

- (NSAttributedString)visibleAttributedText
{
  v2 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v3 = [v2 visibleAttributedText];

  return (NSAttributedString *)v3;
}

- (BOOL)toggleCollapsedAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(ICOutlineController *)self outlineControllerObject];
  LOBYTE(length) = objc_msgSend(v5, "toggleCollapsedAtRange:", location, length);

  return length;
}

- (void)requestUpdate
{
  id v2 = [(ICOutlineController *)self outlineControllerObject];
  [v2 requestUpdate];
}

- (BOOL)canCollapseAnyUUIDs:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICOutlineController *)self outlineControllerObject];
  char v6 = [v5 canCollapseAnyUUIDs:v4];

  return v6;
}

- (void)collapseUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  [v5 collapseUUIDs:v4];
}

- (void)toggleUUIDCollapsed:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  [v5 toggleUUIDCollapsed:v4];
}

- (void)collapseAll
{
  id v2 = [(ICOutlineController *)self outlineControllerObject];
  [v2 collapseAll];
}

- (BOOL)canExpandAnyUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  char v6 = [v5 canExpandAnyUUIDs:v4];

  return v6;
}

- (void)expandUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  [v5 expandUUIDs:v4];
}

- (void)expandAncestorsOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  objc_msgSend(v5, "expandAncestorsOfRange:", location, length);
}

- (void)expandAll
{
  id v2 = [(ICOutlineController *)self outlineControllerObject];
  [v2 expandAll];
}

- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  [v5 collapsibleSectionAffordanceUsedForUUIDs:v4];
}

- (void)resetCollapsibleSectionAffordanceUsages
{
  id v2 = [(ICOutlineController *)self outlineControllerObject];
  [v2 resetCollapsibleSectionAffordanceUsages];
}

- (_NSRange)rangeForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v6 = [v5 rangeForUUID:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)descendantRangeForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v6 = [v5 descendantRangeForUUID:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)closestVisibleAncestorForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v6 = [v5 closestVisibleAncestorForUUID:v4];

  return v6;
}

- (id)ancestorsForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v6 = [v5 ancestorsForUUID:v4];

  return v6;
}

- (id)descendantsForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICOutlineController *)self outlineControllerObject];
  uint64_t v6 = [v5 descendantsForUUID:v4];

  return v6;
}

- (void)setOutlineControllerObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end