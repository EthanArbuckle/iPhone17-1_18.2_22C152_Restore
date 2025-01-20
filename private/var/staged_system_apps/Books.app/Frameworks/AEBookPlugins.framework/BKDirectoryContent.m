@interface BKDirectoryContent
- (BKDirectoryContentDelegate)directoryDelegate;
- (id)locationForPageNumber:(int64_t)a3;
- (id)pageTitleForPageNumber:(int64_t)a3;
- (int64_t)pageNumberForLocation:(id)a3;
- (void)didSelectBookmarkForLocation:(id)a3 annotationUUID:(id)a4;
- (void)didSelectHighlightForLocation:(id)a3 annotationUUID:(id)a4;
- (void)didSelectLocation:(id)a3;
- (void)setDirectoryDelegate:(id)a3;
@end

@implementation BKDirectoryContent

- (void)setDirectoryDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directoryDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_directoryDelegate, obj);
    *(unsigned char *)&self->_directoryContentFlags = *(unsigned char *)&self->_directoryContentFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (void)didSelectLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(BKDirectoryContent *)self directoryDelegate];
  [v5 directoryContent:self didSelectLocation:v4];
}

- (void)didSelectBookmarkForLocation:(id)a3 annotationUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  v7 = BUDynamicCast();
  if (v7)
  {
    v8 = [(BKDirectoryContent *)self directoryDelegate];
    [v8 directoryContent:self didSelectBookmarkForLocation:v7 annotationUUID:v6];
  }
  else
  {
    [(BKDirectoryContent *)self didSelectLocation:v9];
  }
}

- (void)didSelectHighlightForLocation:(id)a3 annotationUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  v7 = BUDynamicCast();
  if (v7)
  {
    v8 = [(BKDirectoryContent *)self directoryDelegate];
    [v8 directoryContent:self didSelectHighlightForLocation:v7 annotationUUID:v6];
  }
  else
  {
    [(BKDirectoryContent *)self didSelectLocation:v9];
  }
}

- (int64_t)pageNumberForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(BKDirectoryContent *)self directoryDelegate];
  id v6 = [v5 directoryContent:self pageNumberForLocation:v4];

  return (int64_t)v6;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    id v6 = 0;
  }
  else if ((*(unsigned char *)&self->_directoryContentFlags & 1) == 0 {
         || ([(BKDirectoryContent *)self directoryDelegate],
  }
             id v5 = objc_claimAutoreleasedReturnValue(),
             [v5 directoryContent:self pageTitleForPageNumber:a3],
             id v6 = objc_claimAutoreleasedReturnValue(),
             v5,
             !v6))
  {
    id v6 = +[NSString stringWithFormat:@"%lu", a3];
  }

  return v6;
}

- (id)locationForPageNumber:(int64_t)a3
{
  id v5 = [(BKDirectoryContent *)self directoryDelegate];
  id v6 = [v5 directoryContent:self locationForPageNumber:a3];

  return v6;
}

- (BKDirectoryContentDelegate)directoryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directoryDelegate);

  return (BKDirectoryContentDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end