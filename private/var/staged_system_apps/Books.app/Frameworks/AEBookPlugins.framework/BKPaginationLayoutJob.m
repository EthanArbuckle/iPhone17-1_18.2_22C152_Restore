@interface BKPaginationLayoutJob
+ (id)jobName;
- (AEBookInfoSnapshot)bookSnapshot;
- (BKPaginationLayoutJob)init;
- (CGSize)contentLayoutSize;
- (NSArray)annotationsToUpgrade;
- (NSArray)bookmarks;
- (NSArray)landmarkAnchors;
- (NSArray)navigationInfoAnchors;
- (NSArray)physicalPageAnchors;
- (NSDictionary)annotationCFIStrings;
- (NSString)href;
- (NSURL)url;
- (WKWebView)webView;
- (int)documentOrdinal;
- (void)copyBatchState:(id)a3;
- (void)copyState:(id)a3;
- (void)setAnnotationCFIStrings:(id)a3;
- (void)setAnnotationsToUpgrade:(id)a3;
- (void)setBookSnapshot:(id)a3;
- (void)setBookmarks:(id)a3;
- (void)setContentLayoutSize:(CGSize)a3;
- (void)setDocumentOrdinal:(int)a3;
- (void)setHref:(id)a3;
- (void)setLandmarkAnchors:(id)a3;
- (void)setNavigationInfoAnchors:(id)a3;
- (void)setPhysicalPageAnchors:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation BKPaginationLayoutJob

+ (id)jobName
{
  return @"BKPaginationLayoutJob";
}

- (BKPaginationLayoutJob)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPaginationLayoutJob;
  v2 = [(BKPaginationBatchJob *)&v5 init];
  if (v2)
  {
    v3 = +[BKPaginationLayoutJob jobName];
    [(BKJob *)v2 setName:v3];
  }
  return v2;
}

- (void)copyState:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BKPaginationLayoutJob;
  id v4 = a3;
  [(BKPaginationBatchJob *)&v14 copyState:v4];
  objc_super v5 = objc_msgSend(v4, "href", v14.receiver, v14.super_class);
  [(BKPaginationLayoutJob *)self setHref:v5];

  v6 = [v4 url];
  [(BKPaginationLayoutJob *)self setUrl:v6];

  v7 = [v4 bookmarks];
  [(BKPaginationLayoutJob *)self setBookmarks:v7];

  v8 = [v4 navigationInfoAnchors];
  [(BKPaginationLayoutJob *)self setNavigationInfoAnchors:v8];

  v9 = [v4 landmarkAnchors];
  [(BKPaginationLayoutJob *)self setLandmarkAnchors:v9];

  v10 = [v4 physicalPageAnchors];
  [(BKPaginationLayoutJob *)self setPhysicalPageAnchors:v10];

  -[BKPaginationLayoutJob setDocumentOrdinal:](self, "setDocumentOrdinal:", [v4 documentOrdinal]);
  [v4 contentLayoutSize];
  [(BKPaginationLayoutJob *)self setContentLayoutSize:"setContentLayoutSize:"];
  v11 = [v4 bookSnapshot];
  [(BKPaginationLayoutJob *)self setBookSnapshot:v11];

  v12 = [v4 annotationsToUpgrade];
  [(BKPaginationLayoutJob *)self setAnnotationsToUpgrade:v12];

  v13 = [v4 annotationCFIStrings];

  [(BKPaginationLayoutJob *)self setAnnotationCFIStrings:v13];
}

- (void)copyBatchState:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKPaginationLayoutJob;
  id v4 = a3;
  [(BKPaginationBatchJob *)&v10 copyState:v4];
  -[BKPaginationLayoutJob setHref:](self, "setHref:", 0, v10.receiver, v10.super_class);
  [(BKPaginationLayoutJob *)self setUrl:0];
  [(BKPaginationLayoutJob *)self setBookmarks:0];
  [(BKPaginationLayoutJob *)self setNavigationInfoAnchors:0];
  [(BKPaginationLayoutJob *)self setLandmarkAnchors:0];
  [(BKPaginationLayoutJob *)self setPhysicalPageAnchors:0];
  [(BKPaginationLayoutJob *)self setDocumentOrdinal:0];
  objc_super v5 = [v4 configuration];
  [(BKPaginationBatchJob *)self setConfiguration:v5];

  [v4 pageSize];
  double v7 = v6;
  double v9 = v8;

  -[BKPaginationLayoutJob setContentLayoutSize:](self, "setContentLayoutSize:", v7, v9);
  [(BKPaginationLayoutJob *)self setBookSnapshot:0];
  [(BKPaginationLayoutJob *)self setAnnotationsToUpgrade:0];
  [(BKPaginationLayoutJob *)self setAnnotationCFIStrings:0];
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (NSArray)navigationInfoAnchors
{
  return self->_navigationInfoAnchors;
}

- (void)setNavigationInfoAnchors:(id)a3
{
}

- (NSArray)landmarkAnchors
{
  return self->_landmarkAnchors;
}

- (void)setLandmarkAnchors:(id)a3
{
}

- (NSArray)physicalPageAnchors
{
  return self->_physicalPageAnchors;
}

- (void)setPhysicalPageAnchors:(id)a3
{
}

- (int)documentOrdinal
{
  return self->_documentOrdinal;
}

- (void)setDocumentOrdinal:(int)a3
{
  self->_documentOrdinal = a3;
}

- (AEBookInfoSnapshot)bookSnapshot
{
  return self->_bookSnapshot;
}

- (void)setBookSnapshot:(id)a3
{
}

- (CGSize)contentLayoutSize
{
  double width = self->_contentLayoutSize.width;
  double height = self->_contentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentLayoutSize:(CGSize)a3
{
  self->_contentLayoutSize = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSArray)annotationsToUpgrade
{
  return self->_annotationsToUpgrade;
}

- (void)setAnnotationsToUpgrade:(id)a3
{
}

- (NSDictionary)annotationCFIStrings
{
  return self->_annotationCFIStrings;
}

- (void)setAnnotationCFIStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationCFIStrings, 0);
  objc_storeStrong((id *)&self->_annotationsToUpgrade, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_bookSnapshot, 0);
  objc_storeStrong((id *)&self->_physicalPageAnchors, 0);
  objc_storeStrong((id *)&self->_landmarkAnchors, 0);
  objc_storeStrong((id *)&self->_navigationInfoAnchors, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_href, 0);
}

@end