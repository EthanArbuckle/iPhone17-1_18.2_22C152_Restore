@interface BKPDFSnapshotMetadata
+ (id)snapshotHelperWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4;
- (BKPDFSnapshotMetadata)initWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4;
- (BOOL)hasLeftPage;
- (BOOL)hasRightPage;
- (CGSize)_pageSize:(id)a3;
- (CGSize)leftPageSize;
- (CGSize)rightPageSize;
- (unint64_t)leftPageIndex;
- (unint64_t)rightPageIndex;
- (void)_cleanupPageIndicesIfNecessaryWithDocument:(id)a3 currentPageIndex:(unint64_t)a4;
@end

@implementation BKPDFSnapshotMetadata

- (BKPDFSnapshotMetadata)initWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKPDFSnapshotMetadata;
  v7 = [(BKPDFSnapshotMetadata *)&v14 init];
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = [v6 pageCount];
  unint64_t v9 = (unint64_t)v8;
  if ((unint64_t)v8 <= a4)
  {
    BCReportAssertionFailureWithMessage();
    *(int64x2_t *)&v7->_leftPageIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    p_leftPageIndex = &v7->_leftPageIndex;
    goto LABEL_14;
  }
  v7->_leftPageIndex = a4;
  v7->_rightPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  p_leftPageIndex = &v7->_leftPageIndex;
  if (a4)
  {
    unint64_t v12 = a4 - 1;
    unint64_t *p_leftPageIndex = a4 - 1;
    unint64_t v11 = a4;
    goto LABEL_7;
  }
  unint64_t v11 = a4 + 1;
  unint64_t v12 = a4;
  if (a4 + 1 < (unint64_t)v8) {
LABEL_7:
  }
    v7->_rightPageIndex = v11;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    BCReportAssertionFailureWithMessage();
    unint64_t v12 = *p_leftPageIndex;
  }
  if (v12 >= v9) {
    BCReportAssertionFailureWithMessage();
  }
  [(BKPDFSnapshotMetadata *)v7 _cleanupPageIndicesIfNecessaryWithDocument:v6 currentPageIndex:a4];
LABEL_12:

  return v7;
}

- (BOOL)hasLeftPage
{
  return [(BKPDFSnapshotMetadata *)self leftPageIndex] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasRightPage
{
  return [(BKPDFSnapshotMetadata *)self rightPageIndex] != 0x7FFFFFFFFFFFFFFFLL;
}

- (CGSize)_pageSize:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    [v3 boundsForBox:1];
    double v6 = v5;
    CGFloat width = v7;
    if (fabs((double)((uint64_t)[v4 rotation] % 180)) >= 0.00999999978)
    {
      CGFloat height = v6;
    }
    else
    {
      CGFloat height = width;
      CGFloat width = v6;
    }
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)_cleanupPageIndicesIfNecessaryWithDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if (self->_leftPageIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
    goto LABEL_3;
  }
  unint64_t rightPageIndex = self->_rightPageIndex;
  uint64_t v11 = [v6 pageAtIndex:];
  id v8 = (void *)v11;
  if (rightPageIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11)
    {
      [(BKPDFSnapshotMetadata *)self _pageSize:v11];
      self->_leftPageSize.double width = v12;
      self->_leftPageSize.double height = v13;
      goto LABEL_40;
    }
    self->_leftPageSize = CGSizeZero;
    goto LABEL_3;
  }
  unint64_t v9 = [v7 pageAtIndex:self->_rightPageIndex];
  [(BKPDFSnapshotMetadata *)self _pageSize:v8];
  self->_leftPageSize.double width = v14;
  self->_leftPageSize.double height = v15;
  [(BKPDFSnapshotMetadata *)self _pageSize:v9];
  self->_rightPageSize.double width = v16;
  self->_rightPageSize.double height = v17;
  unint64_t leftPageIndex = self->_leftPageIndex;
  if (leftPageIndex == a4) {
    double width = self->_leftPageSize.width;
  }
  else {
    double width = v16;
  }
  if (leftPageIndex == a4) {
    double height = self->_leftPageSize.height;
  }
  else {
    double height = v17;
  }
  BOOL v21 = self->_leftPageSize.width != v16;
  if (self->_leftPageSize.height != v17) {
    BOOL v21 = 1;
  }
  if (!v9 || (height >= width ? (BOOL v22 = !v21) : (BOOL v22 = 0), !v22))
  {
    if (height >= width)
    {
      if (v21)
      {
        v24 = BKModernPDFLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_137CB0();
        }
      }
      else
      {
        if (v9) {
          goto LABEL_39;
        }
        v24 = BKModernPDFLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_137CE4();
        }
      }
    }
    else
    {
      v24 = BKModernPDFLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_137C7C();
      }
    }

LABEL_39:
    self->_leftPageSize.double width = width;
    self->_leftPageSize.double height = height;
    self->_unint64_t leftPageIndex = a4;
    self->_unint64_t rightPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_rightPageSize = CGSizeZero;

    if (v8)
    {
LABEL_40:
      unint64_t v9 = BKModernPDFLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Configured for one page spread image.", v25, 2u);
      }
      goto LABEL_5;
    }
LABEL_3:
    unint64_t v9 = BKModernPDFLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_137C48();
    }
    goto LABEL_5;
  }
  if (!v8)
  {
    id v8 = v9;
    goto LABEL_3;
  }
  v23 = BKModernPDFLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Configured for two page spread image.", buf, 2u);
  }

LABEL_5:
}

+ (id)snapshotHelperWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[BKPDFSnapshotMetadata alloc] initWithPDFDocument:v5 currentPageIndex:a4];

  return v6;
}

- (unint64_t)leftPageIndex
{
  return self->_leftPageIndex;
}

- (unint64_t)rightPageIndex
{
  return self->_rightPageIndex;
}

- (CGSize)leftPageSize
{
  double width = self->_leftPageSize.width;
  double height = self->_leftPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)rightPageSize
{
  double width = self->_rightPageSize.width;
  double height = self->_rightPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end