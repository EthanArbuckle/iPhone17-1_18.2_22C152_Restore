@interface CRLNearbyElementRotorSearchController
+ (id)nearbyDescriptionForLayoutFrame:(CGRect)a3 andSelectedLayoutFrame:(CGRect)a4;
+ (id)searchTargetSearchSelectors;
- (BOOL)shouldChangeSelectionPath;
- (CRLCanvasRep)selectedRep;
- (id)focusedRep;
- (id)nearbyDescriptionForSearchReference:(id)a3;
- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4;
- (unint64_t)distanceToSelectedSearchReference:(id)a3;
- (void)_addObservers;
- (void)sortLayoutSearchResultsArray:(id)a3;
@end

@implementation CRLNearbyElementRotorSearchController

+ (id)nearbyDescriptionForLayoutFrame:(CGRect)a3 andSelectedLayoutFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  double v54 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double MidX = CGRectGetMidX(a3);
  v57.origin.double x = v11;
  v57.origin.double y = v10;
  v57.size.double width = v9;
  v57.size.double height = v8;
  double MidY = CGRectGetMidY(v57);
  v58.origin.double x = x;
  v58.origin.double y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  double v12 = CGRectGetMidX(v58);
  v59.origin.double x = x;
  v59.origin.double y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  double v13 = MidX - v12;
  double v52 = MidY - CGRectGetMidY(v59);
  sub_100445600(x, y, width, height, v11, v10, v9, v54);
  int v14 = (int)v13;
  int v15 = (int)v52;
  uint64_t v18 = (int)sqrt(v16 * v16 + v17 * v17);
  v19 = +[NSBundle mainBundle];
  v55 = [v19 localizedStringForKey:@"%d points close to selection’s bottom right corner" value:0 table:0];

  v20 = +[NSBundle mainBundle];
  v53 = [v20 localizedStringForKey:@"%d points close to selection’s bottom left corner" value:0 table:0];

  v21 = +[NSBundle mainBundle];
  v50 = [v21 localizedStringForKey:@"%d points close to selection’s top right corner" value:0 table:0];

  v22 = +[NSBundle mainBundle];
  v48 = [v22 localizedStringForKey:@"%d points close to selection’s top left corner" value:0 table:0];

  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"%d points close to selection’s top edge" value:0 table:0];

  v25 = +[NSBundle mainBundle];
  v26 = [v25 localizedStringForKey:@"%d points close to selection’s left edge" value:0 table:0];

  v27 = +[NSBundle mainBundle];
  v28 = [v27 localizedStringForKey:@"%d points close to selection’s bottom edge" value:0 table:0];

  v29 = +[NSBundle mainBundle];
  v30 = [v29 localizedStringForKey:@"%d points close to selection’s right edge" value:0 table:0];

  v31 = +[NSBundle mainBundle];
  v32 = [v31 localizedStringForKey:@"horizontally centered" value:0 table:0];

  v33 = +[NSBundle mainBundle];
  v34 = [v33 localizedStringForKey:@"vertically centered" value:0 table:0];

  v35 = +[NSMutableArray array];
  if ((int)v13 >= 0) {
    int v36 = (int)v13;
  }
  else {
    int v36 = -v14;
  }
  if (width * 0.25 > (double)v36)
  {
    if (v15 <= 0) {
      v37 = v24;
    }
    else {
      v37 = v28;
    }
    v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v37, 0.25, (double)v36, width * 0.25, v18);
    [v35 addObject:v38];

    if (v14) {
      goto LABEL_28;
    }
    v39 = v35;
    v40 = v34;
    goto LABEL_19;
  }
  if (v15 >= 0) {
    int v41 = v15;
  }
  else {
    int v41 = -v15;
  }
  double v42 = height * 0.25;
  if (height * 0.25 <= (double)v41)
  {
    if (v15 < 1)
    {
      if (v14 < 1) {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v42, v18);
      }
      else {
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v50, v42, v18);
      }
    }
    else if (v14 < 1)
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v53, v42, v18);
    }
    else
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v55, v42, v18);
    v45 = };
    [v35 addObject:v45];

    goto LABEL_28;
  }
  if (v14 <= 0) {
    v43 = v26;
  }
  else {
    v43 = v30;
  }
  v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, v42, v18);
  [v35 addObject:v44];

  if (!v15)
  {
    v39 = v35;
    v40 = v32;
LABEL_19:
    [v39 addObject:v40];
  }
LABEL_28:
  v46 = [v35 componentsJoinedByString:@", "];

  return v46;
}

- (unint64_t)distanceToSelectedSearchReference:(id)a3
{
  [a3 searchReferenceLayoutFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CRLNearbyElementRotorSearchController *)self selectedRep];
  double v13 = [v12 layout];
  [v13 alignmentFrameInRoot];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v26.origin.double x = v5;
  v26.origin.double y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  v27.origin.double x = v15;
  v27.origin.double y = v17;
  v27.size.double width = v19;
  v27.size.double height = v21;
  if (CGRectEqualToRect(v26, v27))
  {
    double v22 = 1.79769313e308;
  }
  else
  {
    sub_100445600(v5, v7, v9, v11, v15, v17, v19, v21);
    if (v22 >= 0.0) {
      double v22 = sqrt(v22 * v22 + v23 * v23);
    }
  }
  unint64_t v24 = vcvtmd_u64_f64(v22);

  return v24;
}

- (id)nearbyDescriptionForSearchReference:(id)a3
{
  [a3 searchReferenceLayoutFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CRLNearbyElementRotorSearchController *)self selectedRep];
  double v13 = [v12 layout];
  [v13 alignmentFrameInRoot];
  double v18 = +[CRLNearbyElementRotorSearchController nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:](CRLNearbyElementRotorSearchController, "nearbyDescriptionForLayoutFrame:andSelectedLayoutFrame:", v5, v7, v9, v11, v14, v15, v16, v17);

  return v18;
}

- (BOOL)shouldChangeSelectionPath
{
  return 0;
}

+ (id)searchTargetSearchSelectors
{
  v2 = +[NSValue valueWithPointer:"layoutSearchForNearbyElementsWithHitBlock:"];
  double v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6 = a3;
  [(CRLModelSearchController *)self buildSearchResultsIfNecessary];
  if ([(CRLModelSearchController *)self searchResultsCount])
  {
    unint64_t v7 = [(CRLNearbyElementRotorSearchController *)self distanceToSelectedSearchReference:v6];
    double v8 = [(CRLModelSearchController *)self layoutSearchResults];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100445AC0;
    v16[3] = &unk_1014FA2A0;
    v16[4] = self;
    unint64_t v18 = v7;
    id v17 = v6;
    uint64_t v9 = (uint64_t)[v8 indexOfObjectPassingTest:v16];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = -1;
    }
    if (a4) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 1;
    }
    uint64_t v11 = (uint64_t)[(CRLModelSearchController *)self searchResultsCount] - 1;
    if (v11 >= v9 + v10) {
      uint64_t v11 = v9 + v10;
    }
    uint64_t v12 = v11 & ~(v11 >> 63);
    double v13 = [(CRLModelSearchController *)self layoutSearchResults];
    double v14 = [v13 objectAtIndexedSubscript:v12];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100445C48;
  v7[3] = &unk_1014FA2C8;
  v7[4] = self;
  id v4 = a3;
  double v5 = +[NSPredicate predicateWithBlock:v7];
  [v4 filterUsingPredicate:v5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100445D0C;
  v6[3] = &unk_1014FA2F0;
  v6[4] = self;
  [v4 sortUsingComparator:v6];
}

- (void)_addObservers
{
  v6.receiver = self;
  v6.super_class = (Class)CRLNearbyElementRotorSearchController;
  [(CRLRotorSearchController *)&v6 _addObservers];
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = [(CRLRotorSearchController *)self interactiveCanvasController];
  double v5 = [v4 editorController];
  [v3 addObserver:self selector:"_editorControllerSelectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v5];
}

- (CRLCanvasRep)selectedRep
{
  v3 = objc_opt_class();
  id v4 = [(CRLRotorSearchController *)self interactiveCanvasController];
  double v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  objc_super v6 = [v5 crlaxFirstSelectedRep];
  unint64_t v7 = [v6 crlaxTarget];

  return (CRLCanvasRep *)v7;
}

- (id)focusedRep
{
  char v7 = 0;
  v2 = +[CRLAccessibility currentlyFocusedElement];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  double v5 = (void *)v4;

  return v5;
}

@end