@interface PFXPattern
- (void)dealloc;
- (void)end;
- (void)setImageHref:(id)a3;
@end

@implementation PFXPattern

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXPattern;
  [(PFXSvgElement *)&v3 dealloc];
}

- (void)setImageHref:(id)a3
{
  self->mImageHref = (NSString *)[a3 copy];
}

- (void)end
{
  id v3 = [[-[PFXSvgDefsDocument readerState](self->super.mDocument, "readerState") imageDataForUri:[NSString stringByRemovingPercentEncoding](self->mImageHref, "stringByRemovingPercentEncoding")];
  id v4 = [(PFXSvgElement *)self valueForAttributeName:"fillTechnique"];
  id v5 = (id)qword_5736E8;
  if (!qword_5736E8)
  {
    id v5 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:[NSNumber numberWithInteger:0], @"naturalSize", [NSNumber numberWithInteger:1], @"stretch", [NSNumber numberWithInteger:2], @"tile", [NSNumber numberWithInteger:3], @"scaleToFill", [NSNumber numberWithInteger:4], @"scaleToFit", 0];
    qword_5736E8 = (uint64_t)v5;
  }
  id v6 = [v5 objectForKey:v4];
  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0;
  }
  id v8 = +[PFXGraphicStyle newImageFillWithImageData:technique:tintColor:contentState:](PFXGraphicStyle, "newImageFillWithImageData:technique:tintColor:contentState:", v3, v7, +[PFXStyleUtilities htmlStringToColor:[(PFXSvgElement *)self valueForAttributeName:"tintColor"]], [(PFXSvgDefsDocument *)self->super.mDocument readerState]);
  [(PFXSvgElement *)self cacheDefinition:v8];
}

@end