@interface UIPickerColumnView
- (BOOL)_containsTable:(id)a3;
- (BOOL)_pointLiesWithinEffectiveTableBounds:(CGPoint)a3;
- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4;
- (BOOL)_soundsEnabled;
- (BOOL)_usesCheckSelection;
- (BOOL)canBecomeFocused;
- (BOOL)isNoLongerInUse;
- (BOOL)isRowChecked:(int64_t)a3;
- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6;
- (CATransform3D)_transformForTableWithPerspectiveTranslationX:(SEL)a3;
- (CATransform3D)_transformForTableWithTranslationX:(SEL)a3;
- (CATransform3D)perspectiveTransform;
- (CGRect)_defaultFocusRegionFrame;
- (CGRect)_tableFrame;
- (CGRect)accessibilityFrame;
- (CGRect)selectionBarRect;
- (UIColor)_textColor;
- (UIPickerColumnView)initWithFrame:(CGRect)a3 tableFrame:(CGRect)a4 middleBarHeight:(double)a5 rowHeight:(double)a6 paddingAroundWheels:(double)a7 pickerView:(id)a8 transform:(CATransform3D *)a9;
- (UIView)highlightedRegion;
- (_NSRange)_visibleGlobalRows;
- (double)_horizontalBiasForEndTables;
- (double)leftHitTestExtension;
- (double)rightHitTestExtension;
- (double)rowHeight;
- (id)_allVisibleCells;
- (id)_createContainerViewWithFrame:(CGRect)a3;
- (id)_createTableViewWithFrame:(CGRect)a3 containingFrame:(CGRect)a4;
- (id)_defaultFocusEffect;
- (id)_preferredTable;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_visibleCellClosestToPoint:(CGPoint)a3 inView:(id)a4;
- (id)cellForRowAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)selectionBarRow;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_centerTableInContainer:(id)a3;
- (void)_moveTableViewIfNecessary:(id)a3 toContentOffset:(CGPoint)a4;
- (void)_pickerTableViewDidChangeContentOffset:(id)a3;
- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5;
- (void)_setTextColor:(id)a3;
- (void)beginUpdates;
- (void)endUpdates;
- (void)markAsNoLongerInUse;
- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5;
- (void)reloadData;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setIsNoLongerInUse:(BOOL)a3;
- (void)setLeftHitTestExtension:(double)a3;
- (void)setPerspectiveTransform:(CATransform3D *)a3;
- (void)setRightHitTestExtension:(double)a3;
- (void)setRowHeight:(double)a3;
- (void)setSelectionBarRect:(CGRect)a3;
@end

@implementation UIPickerColumnView

- (id)_createTableViewWithFrame:(CGRect)a3 containingFrame:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  double height = a3.size.height;
  double v7 = a3.size.width;
  double middleBarHeight = self->_middleBarHeight;
  CGFloat v10 = a4.origin.y + middleBarHeight * 0.5;
  CGFloat v11 = a4.size.height + middleBarHeight;
  UIRoundToViewScale(self);
  double v13 = v12;
  UIRoundToViewScale(self);
  v15 = -[UIPickerTableView initWithFrame:style:visibleRect:]([UIPickerTableView alloc], "initWithFrame:style:visibleRect:", 0, v13, v14, v7, height, x, v10, width, v11);
  [(UITableView *)v15 setDataSource:self];
  [(UITableView *)v15 setRowHeight:self->_rowHeight];
  [(UIScrollView *)v15 setShowsVerticalScrollIndicator:0];
  [(UIView *)v15 setClipsToBounds:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  v17 = [WeakRetained _style];
  [v17 columnContentEdgeInsets];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  -[UITableView _setSectionContentInset:](v15, "_setSectionContentInset:", v19, v21, v23, v25);
  return v15;
}

- (void)_centerTableInContainer:(id)a3
{
  id v7 = a3;
  v3 = [v7 superview];
  [v3 center];
  double v5 = v4;

  [v7 frame];
  [v7 setFrame:v5 + v6 * -0.5];
}

- (id)_createContainerViewWithFrame:(CGRect)a3
{
  v3 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v3 setClipsToBounds:1];
  return v3;
}

- (CATransform3D)_transformForTableWithPerspectiveTranslationX:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeTranslation(retstr, a4, 0.0, 0.0);
  long long v6 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&a.m33 = v6;
  long long v7 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&a.m43 = v7;
  long long v8 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&a.m13 = v8;
  long long v9 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&a.m23 = v9;
  long long v10 = *(_OWORD *)&self->_perspectiveTransform.m33;
  *(_OWORD *)&v19.m31 = *(_OWORD *)&self->_perspectiveTransform.m31;
  *(_OWORD *)&v19.m33 = v10;
  long long v11 = *(_OWORD *)&self->_perspectiveTransform.m43;
  *(_OWORD *)&v19.m41 = *(_OWORD *)&self->_perspectiveTransform.m41;
  *(_OWORD *)&v19.m43 = v11;
  long long v12 = *(_OWORD *)&self->_perspectiveTransform.m13;
  *(_OWORD *)&v19.m11 = *(_OWORD *)&self->_perspectiveTransform.m11;
  *(_OWORD *)&v19.m13 = v12;
  long long v13 = *(_OWORD *)&self->_perspectiveTransform.m23;
  *(_OWORD *)&v19.m21 = *(_OWORD *)&self->_perspectiveTransform.m21;
  *(_OWORD *)&v19.m23 = v13;
  result = CATransform3DConcat(&v21, &a, &v19);
  long long v15 = *(_OWORD *)&v21.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v21.m31;
  *(_OWORD *)&retstr->m33 = v15;
  long long v16 = *(_OWORD *)&v21.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v21.m41;
  *(_OWORD *)&retstr->m43 = v16;
  long long v17 = *(_OWORD *)&v21.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v21.m11;
  *(_OWORD *)&retstr->m13 = v17;
  long long v18 = *(_OWORD *)&v21.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v21.m21;
  *(_OWORD *)&retstr->m23 = v18;
  return result;
}

- (CATransform3D)_transformForTableWithTranslationX:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return CATransform3DMakeTranslation(retstr, a4, 0.0, 0.0);
}

- (UIPickerColumnView)initWithFrame:(CGRect)a3 tableFrame:(CGRect)a4 middleBarHeight:(double)a5 rowHeight:(double)a6 paddingAroundWheels:(double)a7 pickerView:(id)a8 transform:(CATransform3D *)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v14 = a3.size.height;
  double v15 = a3.size.width;
  double v16 = a3.origin.y;
  double v17 = a3.origin.x;
  id v19 = a8;
  v66.receiver = self;
  v66.super_class = (Class)UIPickerColumnView;
  double v20 = -[UIView initWithFrame:](&v66, sel_initWithFrame_, v17, v16, v15, v14);
  CATransform3D v21 = v20;
  if (v20)
  {
    v20->_double middleBarHeight = a5;
    v20->_rowHeight = a6;
    id v22 = objc_storeWeak((id *)&v20->_pickerView, v19);
    v21->_tableFrame.origin.double x = x;
    v21->_tableFrame.origin.double y = y;
    v21->_tableFrame.size.double width = width;
    v21->_tableFrame.size.double height = height;
    long long v23 = *(_OWORD *)&a9->m23;
    long long v25 = *(_OWORD *)&a9->m11;
    long long v24 = *(_OWORD *)&a9->m13;
    *(_OWORD *)&v21->_perspectiveTransform.m21 = *(_OWORD *)&a9->m21;
    *(_OWORD *)&v21->_perspectiveTransform.m23 = v23;
    *(_OWORD *)&v21->_perspectiveTransform.m11 = v25;
    *(_OWORD *)&v21->_perspectiveTransform.m13 = v24;
    long long v26 = *(_OWORD *)&a9->m43;
    long long v28 = *(_OWORD *)&a9->m31;
    long long v27 = *(_OWORD *)&a9->m33;
    *(_OWORD *)&v21->_perspectiveTransform.m41 = *(_OWORD *)&a9->m41;
    *(_OWORD *)&v21->_perspectiveTransform.m43 = v26;
    *(_OWORD *)&v21->_perspectiveTransform.m31 = v28;
    *(_OWORD *)&v21->_perspectiveTransform.m33 = v27;
    v21->_paddingAroundWheels = a7;
    double v29 = v14 * 0.5 - a5 * 0.5;
    id v30 = v22;
    int v31 = [v19 _magnifierEnabled];

    double v61 = v29;
    if (v31)
    {
      uint64_t v32 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, 0.0, v15, v29);
      topContainerView = v21->_topContainerView;
      v21->_topContainerView = (UIView *)v32;

      uint64_t v34 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y, width, height, 0.0, 0.0, v15, v29);
      topTable = v21->_topTable;
      v21->_topTable = (UIPickerTableView *)v34;

      [(UIView *)v21->_topContainerView addSubview:v21->_topTable];
      [(UIPickerColumnView *)v21 _centerTableInContainer:v21->_topTable];
      double v60 = v29 + 0.0;
      double y = y - (v29 + 0.0);
      double v14 = a5;
    }
    else
    {
      double v60 = 0.0;
      double v29 = 0.0;
    }
    uint64_t v36 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, v29, v15, v14);
    middleContainerView = v21->_middleContainerView;
    v21->_middleContainerView = (UIView *)v36;

    uint64_t v38 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y, width, height, 0.0, v29, v15, v14);
    middleTable = v21->_middleTable;
    v21->_middleTable = (UIPickerTableView *)v38;

    [(UIPickerTableView *)v21->_middleTable _setPlaysFeedback:1];
    [(UIView *)v21->_middleContainerView addSubview:v21->_middleTable];
    [(UIPickerColumnView *)v21 _centerTableInContainer:v21->_middleTable];
    id WeakRetained = objc_loadWeakRetained((id *)&v21->_pickerView);
    int v41 = [WeakRetained _magnifierEnabled];

    if (v41)
    {
      uint64_t v42 = -[UIPickerColumnView _createContainerViewWithFrame:](v21, "_createContainerViewWithFrame:", 0.0, v60 + a5, v15, v61);
      bottomContainerView = v21->_bottomContainerView;
      v21->_bottomContainerView = (UIView *)v42;

      uint64_t v44 = -[UIPickerColumnView _createTableViewWithFrame:containingFrame:](v21, "_createTableViewWithFrame:containingFrame:", x, y - a5, width, height, 0.0, v60 + a5, v15, v61);
      bottomTable = v21->_bottomTable;
      v21->_bottomTable = (UIPickerTableView *)v44;

      [(UIView *)v21->_bottomContainerView addSubview:v21->_bottomTable];
      [(UIPickerColumnView *)v21 _centerTableInContainer:v21->_bottomTable];
      [(UIView *)v21 addSubview:v21->_topContainerView];
      [(UIView *)v21 addSubview:v21->_bottomContainerView];
    }
    [(UIView *)v21 addSubview:v21->_middleContainerView];
    [(UIView *)v21 center];
    double v47 = v21->_paddingAroundWheels + width * 0.5 + x - v46;
    id v48 = objc_loadWeakRetained((id *)&v21->_pickerView);
    int v49 = [v48 _magnifierEnabled];

    if (v49)
    {
      v50 = [(UIView *)v21->_topTable layer];
      [(UIPickerColumnView *)v21 _horizontalBiasForEndTables];
      [(UIPickerColumnView *)v21 _transformForTableWithPerspectiveTranslationX:v47 + v51];
      [v50 setSublayerTransform:v65];

      v52 = [(UIView *)v21->_bottomTable layer];
      [(UIPickerColumnView *)v21 _horizontalBiasForEndTables];
      [(UIPickerColumnView *)v21 _transformForTableWithPerspectiveTranslationX:v47 + v53];
      [v52 setSublayerTransform:v64];

      v54 = [(UIView *)v21->_middleTable layer];
      [(UIPickerColumnView *)v21 _transformForTableWithTranslationX:v47];
      [v54 setSublayerTransform:v63];
    }
    else
    {
      v55 = [(UIView *)v21->_middleTable layer];
      [(UIPickerColumnView *)v21 _transformForTableWithPerspectiveTranslationX:v47];
      [v55 setSublayerTransform:v62];
    }
    [(UIScrollView *)v21->_topTable setScrollEnabled:0];
    [(UIScrollView *)v21->_bottomTable setScrollEnabled:0];
    v56 = [(UIScrollView *)v21->_middleTable panGestureRecognizer];
    [(UIView *)v21 addGestureRecognizer:v56];

    v57 = [v19 _style];
    [v57 applyCustomizationsToColumn:v21];

    v58 = v21;
  }

  return v21;
}

- (BOOL)_containsTable:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:self->_topTable] & 1) != 0
    || ([v4 isEqual:self->_middleTable] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqual:self->_bottomTable];
  }

  return v5;
}

- (id)_preferredTable
{
  return self->_middleTable;
}

- (CGRect)_tableFrame
{
  return CGRectOffset(self->_tableFrame, self->_paddingAroundWheels, 0.0);
}

- (BOOL)_pointLiesWithinEffectiveTableBounds:(CGPoint)a3
{
  double leftHitTestExtension = self->_leftHitTestExtension;
  v6.origin.double y = self->_tableFrame.origin.y;
  v6.size.double height = self->_tableFrame.size.height;
  v6.origin.double x = self->_tableFrame.origin.x - leftHitTestExtension;
  v6.size.double width = self->_tableFrame.size.width + leftHitTestExtension + self->_rightHitTestExtension;
  return CGRectContainsPoint(v6, a3);
}

- (double)_horizontalBiasForEndTables
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  id v4 = [WeakRetained _style];
  [(UIView *)self frame];
  objc_msgSend(v4, "horizontalBiasForEndTablesWithColumnFrame:tableFrame:");
  double v6 = v5;

  return v6;
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  return [(UIPickerColumnView *)self selectRow:a3 animated:a4 notify:a5 updateChecked:1];
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6
{
  return [(UIPickerTableView *)self->_middleTable selectRow:a3 animated:a4 notify:a5 updateChecked:a6];
}

- (BOOL)isRowChecked:(int64_t)a3
{
  return [(UIPickerTableView *)self->_middleTable isRowChecked:a3];
}

- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4
{
  return [(UIPickerTableView *)self->_middleTable _scrollRowAtIndexPathToSelectionBar:a3 animated:a4];
}

- (int64_t)selectionBarRow
{
  return [(UIPickerTableView *)self->_middleTable selectionBarRow];
}

- (void)setSelectionBarRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v9 = [WeakRetained _magnifierEnabled];

  if (v9)
  {
    -[UIPickerTableView setSelectionBarRect:](self->_topTable, "setSelectionBarRect:", x, y, width, height);
    -[UIPickerTableView setSelectionBarRect:](self->_bottomTable, "setSelectionBarRect:", x, y, width, height);
  }
  middleTable = self->_middleTable;
  -[UIPickerTableView setSelectionBarRect:](middleTable, "setSelectionBarRect:", x, y, width, height);
}

- (void)markAsNoLongerInUse
{
  [(UIPickerColumnView *)self setIsNoLongerInUse:1];
  [(UIPickerColumnView *)self reloadData];
}

- (CGRect)selectionBarRect
{
  [(UIPickerTableView *)self->_middleTable selectionBarRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5
{
  id v7 = a4;
  if ([v7 isEqual:self->_middleTable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    [WeakRetained _sendSelectionChangedFromTable:v7 notify:1];
  }
}

- (BOOL)_soundsEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  char v3 = [WeakRetained _soundsEnabled];

  return v3;
}

- (BOOL)_usesCheckSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  char v3 = [WeakRetained _usesCheckSelection];

  return v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return [(UITableView *)self->_middleTable numberOfRowsInSection:a3];
}

- (id)cellForRowAtIndexPath:(id)a3
{
  return [(UITableView *)self->_middleTable cellForRowAtIndexPath:a3];
}

- (void)setRowHeight:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v6 = [WeakRetained _magnifierEnabled];

  if (v6)
  {
    [(UITableView *)self->_topTable setRowHeight:a3];
    [(UITableView *)self->_bottomTable setRowHeight:a3];
  }
  middleTable = self->_middleTable;
  [(UITableView *)middleTable setRowHeight:a3];
}

- (void)reloadData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v4 = [WeakRetained _magnifierEnabled];

  if (v4)
  {
    [(UITableView *)self->_topTable reloadData];
    [(UITableView *)self->_bottomTable reloadData];
  }
  middleTable = self->_middleTable;
  [(UITableView *)middleTable reloadData];
}

- (void)beginUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v4 = [WeakRetained _magnifierEnabled];

  if (v4)
  {
    [(UITableView *)self->_topTable beginUpdates];
    [(UITableView *)self->_bottomTable beginUpdates];
  }
  middleTable = self->_middleTable;
  [(UITableView *)middleTable beginUpdates];
}

- (void)endUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v4 = [WeakRetained _magnifierEnabled];

  if (v4)
  {
    [(UITableView *)self->_topTable endUpdates];
    [(UITableView *)self->_bottomTable endUpdates];
  }
  middleTable = self->_middleTable;
  [(UITableView *)middleTable endUpdates];
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v6 = [WeakRetained _magnifierEnabled];

  if (v6)
  {
    [(UITableView *)self->_topTable setAllowsMultipleSelection:v3];
    [(UITableView *)self->_bottomTable setAllowsMultipleSelection:v3];
  }
  middleTable = self->_middleTable;
  [(UITableView *)middleTable setAllowsMultipleSelection:v3];
}

- (void)_moveTableViewIfNecessary:(id)a3 toContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  [v9 contentOffset];
  if (v7 != x || v6 != y) {
    objc_msgSend(v9, "_setContentOffset:notify:", 0, x, y);
  }
}

- (void)_pickerTableViewDidChangeContentOffset:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
  int v5 = [WeakRetained _magnifierEnabled];

  if (v5)
  {
    [v10 contentOffset];
    double v7 = v6;
    double v9 = v8;
    if ([v10 isEqual:self->_topTable])
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_middleTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_bottomTable, v7, v9);
    }
    if ([v10 isEqual:self->_middleTable])
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_topTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_bottomTable, v7, v9);
    }
    if ([v10 isEqual:self->_bottomTable])
    {
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_topTable, v7, v9);
      -[UIPickerColumnView _moveTableViewIfNecessary:toContentOffset:](self, "_moveTableViewIfNecessary:toContentOffset:", self->_middleTable, v7, v9);
    }
  }
}

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  if ([a3 isEqual:self->_middleTable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_pickerView);
      [v10 pickerTableView:self->_middleTable didChangeSelectionBarRowFrom:a4 to:a5];
    }
  }
}

- (_NSRange)_visibleGlobalRows
{
  NSUInteger v2 = [(UITableView *)self->_middleTable _visibleGlobalRows];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)_allVisibleCells
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CA80];
  int v4 = [(UITableView *)self->_topTable visibleCells];
  int v5 = [v3 setWithArray:v4];

  double v6 = [(UITableView *)self->_middleTable visibleCells];
  [v5 addObjectsFromArray:v6];

  double v7 = [(UITableView *)self->_bottomTable visibleCells];
  [v5 addObjectsFromArray:v7];

  double v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];

  return v8;
}

- (id)_visibleCellClosestToPoint:(CGPoint)a3 inView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v8 = [(UIPickerColumnView *)self _allVisibleCells];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    long long v11 = 0;
    uint64_t v12 = *(void *)v25;
    double v13 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v15 bounds];
        objc_msgSend(v15, "convertRect:toView:", v7);
        UIDistanceBetweenPointAndRect(x, y, v16, v17, v18, v19);
        double v21 = v20;
        if (!v11 || v13 >= v20)
        {
          id v22 = v15;

          double v13 = v21;
          long long v11 = v22;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(UIPickerColumnView *)self isNoLongerInUse])
  {
    int64_t v7 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    int64_t v7 = [WeakRetained tableView:v6 numberOfRowsInSection:a4];
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIPickerColumnView *)self isNoLongerInUse])
  {
    double v8 = [[UIPickerTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
  }
  else
  {
    p_pickerView = &self->_pickerView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerView);
    double v8 = [WeakRetained tableView:v6 cellForRowAtIndexPath:v7];

    if ([v6 isEqual:self->_middleTable])
    {
      id v11 = objc_loadWeakRetained((id *)&self->_pickerView);
      uint64_t v12 = [v11 _magnifierEnabled];
    }
    else
    {
      uint64_t v12 = 0;
    }
    id v13 = objc_loadWeakRetained((id *)p_pickerView);
    -[UIPickerTableViewCell _setIsCenterCell:shouldModifyAlphaOfView:](v8, "_setIsCenterCell:shouldModifyAlphaOfView:", v12, [v13 _magnifierEnabled]);
  }
  return v8;
}

- (BOOL)canBecomeFocused
{
  return _AXSFullKeyboardAccessEnabled() != 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  NSUInteger v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    id v6 = _UIFocusNearestAncestorEnvironmentScrollableContainer(self, 1);
    if (v6)
    {
      int v5 = 0;
    }
    else
    {
      int v5 = _UIFocusGroupIdentifierForInstance(self);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPickerColumnView;
    int v5 = [(UIView *)&v8 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (CGRect)_defaultFocusRegionFrame
{
  double x = self->_tableFrame.origin.x;
  double y = self->_tableFrame.origin.y;
  double width = self->_tableFrame.size.width;
  double height = self->_tableFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)accessibilityFrame
{
  double x = self->_tableFrame.origin.x;
  double y = self->_tableFrame.origin.y;
  double width = self->_tableFrame.size.width;
  double height = self->_tableFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_defaultFocusEffect
{
  return +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E4F39EA8], self->_tableFrame.origin.x, self->_tableFrame.origin.y, self->_tableFrame.size.width, self->_tableFrame.size.height, 5.0);
}

- (UIView)highlightedRegion
{
  return self->_middleContainerView;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (CATransform3D)perspectiveTransform
{
  long long v3 = *(_OWORD *)&self[4].m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m32;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[4].m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m42;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[4].m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[4].m12;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[4].m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[4].m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setPerspectiveTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_perspectiveTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_perspectiveTransform.m23 = v3;
  *(_OWORD *)&self->_perspectiveTransform.m11 = v5;
  *(_OWORD *)&self->_perspectiveTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_perspectiveTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_perspectiveTransform.m43 = v6;
  *(_OWORD *)&self->_perspectiveTransform.m31 = v8;
  *(_OWORD *)&self->_perspectiveTransform.m33 = v7;
}

- (UIColor)_textColor
{
  return self->__textColor;
}

- (void)_setTextColor:(id)a3
{
}

- (double)leftHitTestExtension
{
  return self->_leftHitTestExtension;
}

- (void)setLeftHitTestExtension:(double)a3
{
  self->_double leftHitTestExtension = a3;
}

- (double)rightHitTestExtension
{
  return self->_rightHitTestExtension;
}

- (void)setRightHitTestExtension:(double)a3
{
  self->_rightHitTestExtension = a3;
}

- (BOOL)isNoLongerInUse
{
  return self->_isNoLongerInUse;
}

- (void)setIsNoLongerInUse:(BOOL)a3
{
  self->_isNoLongerInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textColor, 0);
  objc_destroyWeak((id *)&self->_pickerView);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_middleContainerView, 0);
  objc_storeStrong((id *)&self->_topContainerView, 0);
  objc_storeStrong((id *)&self->_bottomTable, 0);
  objc_storeStrong((id *)&self->_middleTable, 0);
  objc_storeStrong((id *)&self->_topTable, 0);
}

@end