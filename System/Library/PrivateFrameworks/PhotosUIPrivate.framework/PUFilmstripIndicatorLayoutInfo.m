@interface PUFilmstripIndicatorLayoutInfo
- (UIColor)highlightColor;
- (id)clone;
- (void)setHighlightColor:(id)a3;
@end

@implementation PUFilmstripIndicatorLayoutInfo

- (void).cxx_destruct
{
}

- (void)setHighlightColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (id)clone
{
  v3 = [PUFilmstripIndicatorLayoutInfo alloc];
  v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v31 = v6;
  double v32 = v5;
  [(PUTileLayoutInfo *)self size];
  double v30 = v7;
  double v9 = v8;
  [(PUTileLayoutInfo *)self alpha];
  double v11 = v10;
  [(PUTileLayoutInfo *)self cornerRadius];
  double v13 = v12;
  v14 = [(PUTileLayoutInfo *)self cornerCurve];
  unint64_t v15 = [(PUTileLayoutInfo *)self cornerMask];
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v17 = v16;
  [(PUTileLayoutInfo *)self contentsRect];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  v26 = [(PUTileLayoutInfo *)self coordinateSystem];
  v27 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v4, v14, v15, v33, v26, v32, v31, v30, v9, v11, v13, v17, v19, v21, v23, v25);

  v28 = [(PUFilmstripIndicatorLayoutInfo *)self highlightColor];
  [(PUFilmstripIndicatorLayoutInfo *)v27 setHighlightColor:v28];

  return v27;
}

@end