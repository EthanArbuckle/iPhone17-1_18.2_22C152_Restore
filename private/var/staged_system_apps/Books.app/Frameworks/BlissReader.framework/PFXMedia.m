@interface PFXMedia
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFXMedia

- (BOOL)mapStartElementWithState:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PFXMedia;
  -[PFXDrawable mapStartElementWithState:](&v26, "mapStartElementWithState:");
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 currentEntryMediaState];
  id v6 = objc_msgSend(+[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", objc_msgSend(v4, "valueForAttribute:", "src"), objc_msgSend(a3, "entryURI")), "stringByRemovingPercentEncoding");
  id v7 = [v4 valueForAttribute:"poster"];
  v24 = v5;
  if ([v7 length]) {
    id v8 = [v4 valueForAttribute:@"loop" imageDataForUri:[PFXCommon absolutePathWithUrl:relativeToFile:v7 stringByRemovingPercentEncoding] isSharable:1];
  }
  else {
    id v8 = [v4 valueForAttribute:@"loop"];
  }
  unsigned int v23 = [v8 isEqualToString:@"loop"];
  unsigned int v9 = [[v4 valueForAttribute:@"controls"] isEqualToString:@"controls"];
  int v10 = xmlStrEqual((const xmlChar *)[v4 xmlElementName], (const xmlChar *)"audio");
  v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v6));
  v12 = +[AVAsset assetWithURL:v11];
  id v13 = [objc_alloc((Class)TSDMediaStyle) initWithContext:[a3 tspContext] name:0 overridePropertyMap:0 isVariation:0];
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v13);
  v14 = -[THWMovieInfo initWithContext:geometry:style:movieRemoteURL:loadedAsset:]([THWMovieInfo alloc], "initWithContext:geometry:style:movieRemoteURL:loadedAsset:", [a3 tspContext], -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), v13, v11, v12);
  -[THWMovieInfo setProgressKitID:](v14, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", [v4 xmlElementId]));
  -[THWMovieInfo setProgressKitSectionID:](v14, "setProgressKitSectionID:", [a3 nodeGUID]);

  [(THWMovieInfo *)v14 setLoopOption:v23];
  [(THWMovieInfo *)v14 setPosterImageData:v22];
  if (v9) {
    unsigned int v15 = 1;
  }
  else {
    unsigned int v15 = 2;
  }
  if (v10) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  [(THWMovieInfo *)v14 setAudioOnly:v10 != 0];
  [(THWMovieInfo *)v14 setControlStyle:v16];
  [(THWMovieInfo *)v14 setUrlForMPMPC:v11];
  id v17 = [v4 valueForAttribute:"data-start"];
  if (v17)
  {
    [v17 doubleValue];
    -[THWMovieInfo setStartTime:](v14, "setStartTime:");
  }
  id v18 = [v4 valueForAttribute:"data-end"];
  if (v18)
  {
    [v18 doubleValue];
    -[THWMovieInfo setEndTime:](v14, "setEndTime:");
  }
  id v19 = objc_msgSend(objc_msgSend(a3, "ancestorEntryWithElementName:", "object"), "valueForAttribute:", "title");
  if ([v19 length])
  {
    id v20 = [(THWMovieInfo *)v14 accessibilityDescriptions];
    if (!v20)
    {
      id v20 = (id)objc_opt_new();
      [(THWMovieInfo *)v14 setAccessibilityDescriptions:v20];
    }
    [v20 setObject:v19 forKey:@"container"];
  }
  [a3 setUniqueIdForInfo:v14 fromStackEntry:v4];
  [v24 setResult:v14];

  [(PFXDrawablePlacement *)self->super.mPlacement mapEndElementWithState:a3];
  return 0;
}

@end