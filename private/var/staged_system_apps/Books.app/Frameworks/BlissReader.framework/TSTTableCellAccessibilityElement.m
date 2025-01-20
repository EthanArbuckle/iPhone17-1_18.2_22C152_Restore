@interface TSTTableCellAccessibilityElement
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellIDInTable;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isEqual:(id)a3;
- (BOOL)tsaxSelect;
- (CGRect)frameInUnscaledCanvas;
- (NSString)description;
- (NSString)value;
- (TSTTableRepAccessibility)tableRep;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)parentCanvas;
- (id)tableEditor;
- (id)tableModel;
- (unint64_t)accessibilityTraits;
- (unint64_t)hash;
- (void)activate;
- (void)setCellID:(id)a3;
- (void)setTableRep:(id)a3;
@end

@implementation TSTTableCellAccessibilityElement

- (TSTTableRepAccessibility)tableRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)self->_tableRep, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)editingCellIDInTable
{
  v2 = [(TSTTableCellAccessibilityElement *)self tableRep];

  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)[(TSTTableRepAccessibility *)v2 tsaxEditingCellID];
}

- (id)tableModel
{
  v2 = [(TSTTableCellAccessibilityElement *)self tableRep];

  return [(TSTTableRepAccessibility *)v2 tsaxTableModel];
}

- (id)tableEditor
{
  v2 = [(TSTTableCellAccessibilityElement *)self tableRep];

  return [(TSTTableRepAccessibility *)v2 tsaxTableEditor];
}

- (id)parentCanvas
{
  v2 = [(TSTTableCellAccessibilityElement *)self tableRep];

  return [(TSDRepAccessibility *)v2 tsaxCanvas];
}

- (CGRect)frameInUnscaledCanvas
{
  [(TSTTableRepAccessibility *)[(TSTTableCellAccessibilityElement *)self tableRep] tsaxTableModel];
  [(TSTTableCellAccessibilityElement *)self cellID];
  unint64_t v3 = TSTTableMergeRangeAtCellID();
  unint64_t v4 = v3;
  if ((_WORD)v3 == 0xFFFF
    || ((v3 & 0xFF0000) != 0xFF0000 ? (BOOL v5 = HIWORD(v3) == 0) : (BOOL v5 = 1),
        !v5 ? (BOOL v6 = (v3 & 0xFFFF00000000) == 0) : (BOOL v6 = 1),
        v6))
  {
    v7 = [(TSTTableCellAccessibilityElement *)self tableRep];
    uint64_t v9 = [(TSTTableCellAccessibilityElement *)self cellID] | 0x1000100000000;
    v8 = v7;
  }
  else
  {
    v8 = [(TSTTableCellAccessibilityElement *)self tableRep];
    uint64_t v9 = v4;
  }
  [(TSTTableRepAccessibility *)v8 tsaxUnscaledCanvasFrameForCellRange:v9];
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (NSString)value
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3052000000;
  double v13 = sub_2600D0;
  v14 = sub_2600E0;
  uint64_t v15 = 0;
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self cellID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2600EC;
  v6[3] = &unk_46BC58;
  v7 = [(TSTTableCellAccessibilityElement *)self tableRep];
  v8 = &v10;
  unsigned int v9 = v3;
  [(TSTTableRepAccessibility *)v7 tsaxAccessModelForCellID:v3 usingBlock:v6];
  unint64_t v4 = (NSString *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)activate
{
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self tableRep];
  uint64_t v4 = [(TSTTableCellAccessibilityElement *)self cellID];

  [(TSTTableRepAccessibility *)v3 tsaxBeginEditingCellForID:v4 editingSelection:0];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [[self parent] isEqual:[a3 parent]];
    if (v5)
    {
      unsigned int v5 = -[TSTTableRepAccessibility isEqual:](-[TSTTableCellAccessibilityElement tableRep](self, "tableRep"), "isEqual:", [a3 tableRep]);
      if (v5)
      {
        unsigned int v6 = [(TSTTableCellAccessibilityElement *)self cellID];
        LOBYTE(v5) = (([a3 cellID] ^ v6) & 0xFFFFFF) == 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self cellID];
  id v4 = [self parent].hash;
  return (unint64_t)[(TSTTableRepAccessibility *)[(TSTTableCellAccessibilityElement *)self tableRep] hash]+ BYTE2(v3)+ (void)v4+ (unsigned __int16)v3;
}

- (NSString)description
{
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self cellID];
  if ([(TSTTableCellAccessibilityElement *)self tsaxRespondsToSelector:"label" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableCellAccessibilityElementExtras])CFStringRef v4 = [(TSTTableCellAccessibilityElement *)self label]; {
  else
  }
    CFStringRef v4 = 0;
  unsigned int v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = NSStringFromClass(v5);
  CFStringRef v7 = @"; label = \"";
  CFStringRef v8 = &stru_46D7E8;
  if (v4)
  {
    CFStringRef v9 = v4;
  }
  else
  {
    CFStringRef v7 = &stru_46D7E8;
    CFStringRef v9 = &stru_46D7E8;
  }
  if (v4) {
    CFStringRef v8 = @"\"";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; column = %ld; row = %ld%@%@%@>",
           v6,
           self,
           BYTE2(v3),
           (unsigned __int16)v3,
           v7,
           v9,
           v8);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (void)setCellID:(id)a3
{
  self->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (void)setTableRep:(id)a3
{
  self->_tableRep = (TSTTableRepAccessibility *)a3;
}

- (BOOL)tsaxSelect
{
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self tableRep];
  uint64_t v4 = [(TSTTableCellAccessibilityElement *)self cellID];
  unsigned __int8 v5 = [(TSTTableRepAccessibility *)v3 tsaxChildCellIsSelectedAtCellID:v4];
  if ((v5 & 1) == 0)
  {
    [(TSTTableRepAccessibility *)v3 tsaxSelectCellForID:v4];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  return v5 ^ 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if (![(TSTTableCellAccessibilityElement *)self tsaxSelect])
  {
    [(TSTTableCellAccessibilityElement *)self activate];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(TSTTableCellAccessibilityElement *)self value];
  if ([(NSString *)v2 length]) {
    return v2;
  }

  return TSAccessibilityLocalizedString(@"cell.empty.value");
}

- (id)accessibilityLabel
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = sub_278720;
  v21 = sub_278730;
  uint64_t v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_27873C;
  v16[3] = &unk_4573D8;
  v16[4] = self;
  v16[5] = &v17;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v16)) {
    abort();
  }
  unsigned int v3 = (NSString *)v18[5];
  _Block_object_dispose(&v17, 8);
  unsigned int v4 = [(TSTTableCellAccessibilityElement *)self cellID];
  if (![(NSString *)v3 length]) {
    unsigned int v3 = TSAccessibilityLocalizedString(@"table");
  }
  if (((v4 ^ [(TSTTableCellAccessibilityElement *)self editingCellIDInTable]) & 0xFFFFFF) != 0) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = TSAccessibilityLocalizedString(@"is.editing");
  }
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    unsigned int v6 = TSAccessibilityLocalizedString(@"row.column.string %@ %@");
    id v7 = TSAccessibilityLocalizedUnsignedInteger((unsigned __int16)v4 + 1);
    CFStringRef v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, TSAccessibilityLocalizedUnsignedInteger(BYTE2(v4) + 1));
    return __TSAccessibilityStringForVariables(1, v3, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }
  return v5;
}

- (id)accessibilityHint
{
  if ([(TSTTableRepAccessibility *)[(TSTTableCellAccessibilityElement *)self tableRep] tsaxChildCellIsSelectedAtCellID:[(TSTTableCellAccessibilityElement *)self cellID]])
  {
    CFStringRef v2 = @"edit.hint.iOS";
  }
  else
  {
    CFStringRef v2 = @"select.hint.iOS";
  }

  return TSAccessibilityLocalizedString((uint64_t)v2);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)TSTTableCellAccessibilityElement;
  unint64_t v3 = TSAccessibilityTraitContainedByTable | [(TSTTableCellAccessibilityElement *)&v7 accessibilityTraits];
  unsigned int v4 = [(TSTTableRepAccessibility *)[(TSTTableCellAccessibilityElement *)self tableRep] tsaxChildCellIsSelectedAtCellID:[(TSTTableCellAccessibilityElement *)self cellID]];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityElements
{
  unsigned int v3 = [(TSTTableCellAccessibilityElement *)self cellID];
  if ((([(TSTTableCellAccessibilityElement *)self editingCellIDInTable] ^ v3) & 0xFFFFFF) != 0) {
    return 0;
  }
  UIAccessibilityTraits v5 = [(TSTTableRepAccessibility *)[(TSTTableCellAccessibilityElement *)self tableRep] tsaxContainedTextEditingRep];
  if (!v5) {
    return 0;
  }
  else {
    return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, 0);
  }
}

@end