@interface CuratedCollectionRichTextParser
- (BOOL)_mergeRichTextCollectionDescription:(id)a3 itemDescriptions:(id)a4;
- (CuratedCollectionRichTextParser)initWithCollection:(id)a3 collectionItems:(id)a4 traitCollection:(id)a5;
- (GEOPlaceCollection)collection;
- (NSArray)collectionItems;
- (NSAttributedString)collectionDescription;
- (NSDictionary)collectionItemDescriptions;
- (UITraitCollection)traitCollection;
- (id)_baseFont;
- (id)_documentCSS;
- (id)_documentHTMLWithInnerBodyHTML:(id)a3;
- (void)_generatePlainTextDescriptions;
- (void)_generateRichTextDescriptionsWithCompletion:(id)a3;
- (void)_parseHTMLSnippet:(id)a3 group:(id)a4 completion:(id)a5;
- (void)parseRichTextDescriptionsWithCompletion:(id)a3;
@end

@implementation CuratedCollectionRichTextParser

- (CuratedCollectionRichTextParser)initWithCollection:(id)a3 collectionItems:(id)a4 traitCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CuratedCollectionRichTextParser;
  v12 = [(CuratedCollectionRichTextParser *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    v14 = (NSArray *)[v10 copy];
    collectionItems = v13->_collectionItems;
    v13->_collectionItems = v14;

    objc_storeStrong((id *)&v13->_traitCollection, a5);
    [(CuratedCollectionRichTextParser *)v13 _generatePlainTextDescriptions];
  }

  return v13;
}

- (void)_generatePlainTextDescriptions
{
  v2 = self;
  v43[0] = NSFontAttributeName;
  v3 = [(CuratedCollectionRichTextParser *)self _baseFont];
  v44[0] = v3;
  v43[1] = NSForegroundColorAttributeName;
  v4 = +[UIColor labelColor];
  v44[1] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];

  uint64_t v6 = [(GEOPlaceCollection *)v2->_collection collectionDescription];
  v30 = (void *)v6;
  if (v6)
  {
    v7 = (NSAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v5];
    p_super = &v2->_collectionDescription->super;
    v2->_collectionDescription = v7;
  }
  else
  {
    p_super = sub_10057611C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(GEOPlaceCollection *)v2->_collection collectionTitle];
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Missing collectionDescription for: %@", buf, 0xCu);
    }
  }
  id v10 = (void *)v5;

  v32 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)v2->_collectionItems count]];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = v2->_collectionItems;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  v12 = GEOResultRefinementSort_ptr;
  if (v11)
  {
    id v13 = v11;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v16 = objc_alloc((Class)MKMapItemIdentifier);
        objc_super v17 = [v15 placeCollectionItem];
        v18 = [v17 itemIdentifier];
        id v19 = [v16 initWithGEOMapItemIdentifier:v18];

        v20 = [v15 placeCollectionItem];
        v21 = [v20 itemDescription];

        if (v21)
        {
          v22 = [objc_alloc((Class)v12[502]) initWithString:v21 attributes:v10];
          [v32 setObject:v22 forKeyedSubscript:v19];
        }
        else
        {
          v22 = sub_10057611C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = [v15 placeCollectionItem];
            v24 = [v23 itemIdentifier];
            [(GEOPlaceCollection *)v2->_collection collectionTitle];
            v25 = v10;
            v27 = v26 = v2;
            *(_DWORD *)buf = 138412546;
            v39 = v24;
            __int16 v40 = 2112;
            v41 = v27;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Missing itemDescription for: %@ in Collection: %@", buf, 0x16u);

            v2 = v26;
            id v10 = v25;
            v12 = GEOResultRefinementSort_ptr;
          }
        }
      }
      id v13 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v13);
  }

  v28 = (NSDictionary *)[v32 copy];
  collectionItemDescriptions = v2->_collectionItemDescriptions;
  v2->_collectionItemDescriptions = v28;
}

- (void)_generateRichTextDescriptionsWithCompletion:(id)a3
{
  id v22 = a3;
  v4 = sub_10057611C();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = sub_10057611C();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ParseRichText", "", buf, 2u);
  }
  v23 = (void *)v5;

  group = dispatch_group_create();
  v24 = [(GEOPlaceCollection *)self->_collection collectionHTMLDescription];
  *(void *)buf = 0;
  v42 = buf;
  uint64_t v43 = 0x3032000000;
  v44 = sub_1001041D4;
  v45 = sub_100104968;
  id v46 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1009AD060;
  v40[3] = &unk_101312EA0;
  v40[4] = buf;
  [(CuratedCollectionRichTextParser *)self _parseHTMLSnippet:v24 group:group completion:v40];
  v8 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)self->_collectionItems count]];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_collectionItems;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)MKMapItemIdentifier);
        v14 = [v12 placeCollectionItem];
        v15 = [v14 itemIdentifier];
        id v16 = [v13 initWithGEOMapItemIdentifier:v15];

        objc_super v17 = [v12 placeCollectionItem];
        v18 = [v17 itemHTMLDescription];

        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1009AD070;
        v33[3] = &unk_101312EC8;
        id v34 = v8;
        id v19 = v16;
        id v35 = v19;
        [(CuratedCollectionRichTextParser *)self _parseHTMLSnippet:v18 group:group completion:v33];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009AD080;
  block[3] = &unk_101312EF0;
  v31[1] = v23;
  objc_copyWeak(v31, &location);
  v30 = buf;
  id v28 = v8;
  id v29 = v22;
  id v20 = v22;
  id v21 = v8;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (BOOL)_mergeRichTextCollectionDescription:(id)a3 itemDescriptions:(id)a4
{
  collectionDescription = a3;
  if (!a3) {
    collectionDescription = self->_collectionDescription;
  }
  v8 = collectionDescription;
  id v9 = self->_collectionDescription;
  id v10 = a4;
  id v11 = a3;
  if (v9 == v8) {
    unsigned __int8 v12 = 1;
  }
  else {
    unsigned __int8 v12 = [(NSAttributedString *)v9 isEqual:v8];
  }
  id v13 = self->_collectionDescription;
  self->_collectionDescription = v8;
  v14 = v8;

  +[NSMutableDictionary dictionaryWithDictionary:self->_collectionItemDescriptions];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1009AD2B0;
  v22[3] = &unk_101312F18;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (NSDictionary *)v23;
  [v10 enumerateKeysAndObjectsUsingBlock:v22];

  collectionItemDescriptions = self->_collectionItemDescriptions;
  if (collectionItemDescriptions == v15) {
    unsigned __int8 v17 = 1;
  }
  else {
    unsigned __int8 v17 = [(NSDictionary *)collectionItemDescriptions isEqual:v15];
  }
  char v18 = v12 & v17 ^ 1;
  id v19 = (NSDictionary *)[(NSDictionary *)v15 copy];
  id v20 = self->_collectionItemDescriptions;
  self->_collectionItemDescriptions = v19;

  return v18;
}

- (void)parseRichTextDescriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = v4;
  if (self->_didParseRichText)
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = v4;
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  else
  {
    self->_didParseRichText = 1;
    id v6 = v4;
    -[CuratedCollectionRichTextParser _generateRichTextDescriptionsWithCompletion:](self, "_generateRichTextDescriptionsWithCompletion:");
  }
  os_signpost_id_t v5 = v6;
LABEL_6:
}

- (id)_baseFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:self->_traitCollection];
}

- (id)_documentCSS
{
  css = self->_css;
  if (!css)
  {
    id v4 = [(CuratedCollectionRichTextParser *)self _baseFont];
    [v4 pointSize];
    double v6 = v5;

    v7 = +[NSNumber numberWithDouble:v6];
    v8 = [v7 stringValue];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"html { font-family: -apple-system; -webkit-text-size-adjust: 100%%; font-size: %@px; }",
      v8);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_css;
    self->_css = v9;

    css = self->_css;
  }

  return css;
}

- (id)_documentHTMLWithInnerBodyHTML:(id)a3
{
  id v4 = a3;
  double v5 = [(CuratedCollectionRichTextParser *)self _documentCSS];
  double v6 = +[NSString stringWithFormat:@"<head><style type=\"text/css\">%@</style></head><body>%@</body>", v5, v4];

  return v6;
}

- (void)_parseHTMLSnippet:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    dispatch_group_enter(v9);
    id v11 = [(CuratedCollectionRichTextParser *)self _documentHTMLWithInnerBodyHTML:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1009AD5D4;
    v12[3] = &unk_101312F40;
    id v13 = v9;
    id v14 = v10;
    +[NSAttributedString loadFromHTMLWithString:v11 options:&__NSDictionary0__struct completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (NSArray)collectionItems
{
  return self->_collectionItems;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSAttributedString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSDictionary)collectionItemDescriptions
{
  return self->_collectionItemDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionItemDescriptions, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_collectionItems, 0);
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong((id *)&self->_css, 0);
}

@end