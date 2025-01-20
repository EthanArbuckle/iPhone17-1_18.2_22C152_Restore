@interface GeoRequestResponseLogDetailViewController
- (GeoRequestResponseLogDetailViewController)initWithEvent:(id)a3;
- (void)_showPlaceCard;
- (void)_showPlaceCardAt:(unint64_t)a3;
- (void)_showShareAction;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchFor:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GeoRequestResponseLogDetailViewController

- (GeoRequestResponseLogDetailViewController)initWithEvent:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)GeoRequestResponseLogDetailViewController;
  v6 = [(GeoRequestResponseLogDetailViewController *)&v30 init];
  v7 = v6;
  if (v6)
  {
    p_event = (id *)&v6->_event;
    objc_storeStrong((id *)&v6->_event, a3);
    v7->_lastHighlightedRange = (_NSRange)xmmword_100F6F190;
    if ([*p_event eventType] == 2
      && [*p_event messageType] == 60)
    {
      id v25 = v5;
      v9 = [*p_event decodedMessage];
      v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 mapsResultsCount]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v24 = v9;
      v11 = [v9 mapsResults];
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v16 hasPlace])
            {
              v17 = [v16 place];
              v18 = +[GEOMapItemStorage mapItemStorageForPlaceData:v17];

              if (v18) {
                [v10 addObject:v18];
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v13);
      }

      if ([v10 count])
      {
        v19 = (NSArray *)[v10 copy];
        mapItems = v7->_mapItems;
        v7->_mapItems = v19;
      }
      id v5 = v25;
    }
    v21 = (UISearchController *)objc_alloc_init((Class)UISearchController);
    searchController = v7->_searchController;
    v7->_searchController = v21;

    [(UISearchController *)v7->_searchController setDelegate:v7];
    [(UISearchController *)v7->_searchController setActive:1];
    [(UISearchController *)v7->_searchController setSearchResultsUpdater:v7];
    [(UISearchController *)v7->_searchController setObscuresBackgroundDuringPresentation:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)GeoRequestResponseLogDetailViewController;
  [(GeoRequestResponseLogDetailViewController *)&v32 viewDidLoad];
  v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 setDelegate:self];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSArray *)self->_mapItems count])
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"PlaceCard" style:0 target:self action:"_showPlaceCard"];
    [v4 addObject:v5];
  }
  id v31 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Share" style:0 target:self action:"_showShareAction"];
  [v4 addObject:v31];
  v6 = [(GeoRequestResponseLogDetailViewController *)self navigationItem];
  [v6 setRightBarButtonItems:v4];

  searchController = self->_searchController;
  v8 = [(GeoRequestResponseLogDetailViewController *)self navigationItem];
  [v8 setSearchController:searchController];

  v9 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v9;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_textView setEditable:0];
  [(UITextView *)self->_textView setSelectable:1];
  v11 = [(UISearchController *)self->_searchController searchBar];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(GeoRequestResponseLogDetailViewController *)self view];
  [v12 addSubview:self->_textView];

  objc_super v30 = [(GeoRequestResponseLogDetailViewController *)self view];
  long long v29 = [v30 topAnchor];
  long long v28 = [(UITextView *)self->_textView topAnchor];
  long long v27 = [v29 constraintEqualToAnchor:v28];
  v33[0] = v27;
  long long v26 = [(GeoRequestResponseLogDetailViewController *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [(UITextView *)self->_textView leadingAnchor];
  id v13 = [v24 constraintEqualToAnchor:v23];
  v33[1] = v13;
  uint64_t v14 = [(GeoRequestResponseLogDetailViewController *)self view];
  v15 = [v14 trailingAnchor];
  [(UITextView *)self->_textView trailingAnchor];
  v16 = id v25 = v4;
  v17 = [v15 constraintEqualToAnchor:v16];
  v33[2] = v17;
  v18 = [(GeoRequestResponseLogDetailViewController *)self view];
  v19 = [v18 bottomAnchor];
  v20 = [(UITextView *)self->_textView bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v33[3] = v21;
  v22 = +[NSArray arrayWithObjects:v33 count:4];
  +[NSLayoutConstraint activateConstraints:v22];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GeoRequestResponseLogDetailViewController;
  [(GeoRequestResponseLogDetailViewController *)&v15 viewWillAppear:a3];
  id v4 = [(GEORequestResponsePersistedEvent *)self->_event decodedMessage];
  id v5 = [v4 jsonRepresentation];

  v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:3 error:0];
  v7 = (NSString *)[objc_alloc((Class)NSString) initWithData:v6 encoding:4];
  text = self->_text;
  self->_text = v7;

  id v9 = objc_alloc((Class)NSMutableAttributedString);
  v10 = self->_text;
  NSAttributedStringKey v16 = NSForegroundColorAttributeName;
  v11 = +[UIColor labelColor];
  v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v13 = (NSMutableAttributedString *)[v9 initWithString:v10 attributes:v12];
  attributedText = self->_attributedText;
  self->_attributedText = v13;

  [(UITextView *)self->_textView setAttributedText:self->_attributedText];
}

- (void)_showPlaceCard
{
  if ((id)[(NSArray *)self->_mapItems count] == (id)1)
  {
    [(GeoRequestResponseLogDetailViewController *)self _showPlaceCardAt:0];
  }
  else
  {
    v3 = +[UIAlertController alertControllerWithTitle:@"Select Place" message:@"Multiple Places in the result, please select one" preferredStyle:0];
    mapItems = self->_mapItems;
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_1003B3F84;
    v10 = &unk_1012E7850;
    id v11 = v3;
    id v12 = self;
    id v5 = v3;
    [(NSArray *)mapItems enumerateObjectsUsingBlock:&v7];
    v6 = +[UIAlertAction actionWithTitle:@"Nevermind", 1, 0, v7, v8, v9, v10 style handler];
    [v5 addAction:v6];

    [(GeoRequestResponseLogDetailViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_showShareAction
{
  id v3 = objc_alloc((Class)UIActivityViewController);
  text = self->_text;
  id v4 = +[NSArray arrayWithObjects:&text count:1];
  id v5 = [v3 initWithActivityItems:v4 applicationActivities:0];

  v10[0] = UIActivityTypePostToFacebook;
  v10[1] = UIActivityTypePostToWeibo;
  v10[2] = UIActivityTypePrint;
  v10[3] = UIActivityTypeAssignToContact;
  v10[4] = UIActivityTypeSaveToCameraRoll;
  v10[5] = UIActivityTypeAddToReadingList;
  v10[6] = UIActivityTypePostToFlickr;
  v10[7] = UIActivityTypePostToVimeo;
  v10[8] = UIActivityTypePostToTencentWeibo;
  v10[9] = UIActivityTypeOpenInIBooks;
  v10[10] = UIActivityTypeMarkupAsPDF;
  v10[11] = UIActivityTypeSharePlay;
  v10[12] = UIActivityTypeCollaborationInviteWithLink;
  v10[13] = UIActivityTypeCollaborationCopyLink;
  v10[14] = UIActivityTypeAddToHomeScreen;
  v6 = +[NSArray arrayWithObjects:v10 count:15];
  [v5 setExcludedActivityTypes:v6];
  v7 = [(GEORequestResponsePersistedEvent *)self->_event identifier];
  [v5 setTitle:v7];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(GeoRequestResponseLogDetailViewController *)self view];
    id v9 = [v5 popoverPresentationController];
    [v9 setSourceView:v8];
  }
  [(GeoRequestResponseLogDetailViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_showPlaceCardAt:(unint64_t)a3
{
  id v5 = objc_alloc((Class)MUPlaceViewController);
  id v6 = objc_alloc((Class)MKMapItem);
  v7 = [(NSArray *)self->_mapItems objectAtIndexedSubscript:a3];
  id v8 = [v6 initWithGeoMapItem:v7 isPlaceHolderPlace:0];
  id v10 = [v5 initWithMapItem:v8];

  id v9 = [(GeoRequestResponseLogDetailViewController *)self navigationController];
  [v9 pushViewController:v10 animated:1];
}

- (void)searchFor:(id)a3
{
  id v4 = [(NSString *)self->_text rangeOfString:a3 options:1];
  if (v5)
  {
    id v6 = v4;
    NSUInteger v7 = v5;
    p_lastHighlightedRange = &self->_lastHighlightedRange;
    if (self->_lastHighlightedRange.length) {
      [(NSMutableAttributedString *)self->_attributedText removeAttribute:NSBackgroundColorAttributeName range:p_lastHighlightedRange->location];
    }
    p_lastHighlightedRange->location = (NSUInteger)v6;
    self->_lastHighlightedRange.length = v7;
    attributedText = self->_attributedText;
    id v10 = +[UIColor systemYellowColor];
    -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSBackgroundColorAttributeName, v10, p_lastHighlightedRange->location, self->_lastHighlightedRange.length);

    [(UITextView *)self->_textView setAttributedText:self->_attributedText];
    textView = self->_textView;
    -[UITextView scrollRangeToVisible:](textView, "scrollRangeToVisible:", v6, v7);
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(GeoRequestResponseLogDetailViewController *)self searchFor:v4];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  p_lastHighlightedRange = &self->_lastHighlightedRange;
  if (self->_lastHighlightedRange.length)
  {
    [(NSMutableAttributedString *)self->_attributedText removeAttribute:NSBackgroundColorAttributeName range:p_lastHighlightedRange->location];
    [(UITextView *)self->_textView setAttributedText:self->_attributedText];
    _NSRange *p_lastHighlightedRange = (_NSRange)xmmword_100F6F190;
  }
  attributedText = self->_attributedText;
  id v6 = +[UIColor systemYellowColor];
  -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSBackgroundColorAttributeName, v6, p_lastHighlightedRange->location, p_lastHighlightedRange->length);

  textView = self->_textView;

  -[UITextView scrollRangeToVisible:](textView, "scrollRangeToVisible:", 0, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end