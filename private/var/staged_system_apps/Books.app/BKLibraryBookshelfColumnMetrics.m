@interface BKLibraryBookshelfColumnMetrics
+ (id)sectionName;
- (NSDictionary)columns;
- (NSString)description;
- (TUISnap)widthSnap;
- (double)gutter;
- (double)margins;
- (double)maxWidth;
- (double)smallGutter;
- (double)smallMargins;
- (double)vertical;
- (int64_t)columnsForContainingWidth:(double)a3;
- (int64_t)smallColumns;
- (void)configureWithSection:(id)a3;
- (void)setColumns:(id)a3;
- (void)setGutter:(double)a3;
- (void)setMargins:(double)a3;
- (void)setMaxWidth:(double)a3;
- (void)setSmallColumns:(int64_t)a3;
- (void)setSmallGutter:(double)a3;
- (void)setSmallMargins:(double)a3;
- (void)setVertical:(double)a3;
- (void)setWidthSnap:(id)a3;
@end

@implementation BKLibraryBookshelfColumnMetrics

+ (id)sectionName
{
  return @"column";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  [v4 floatForKey:@"gutter"];
  -[BKLibraryBookshelfColumnMetrics setGutter:](self, "setGutter:");
  [v4 floatForKey:@"small-gutter"];
  -[BKLibraryBookshelfColumnMetrics setSmallGutter:](self, "setSmallGutter:");
  [v4 floatForKey:@"margins"];
  -[BKLibraryBookshelfColumnMetrics setMargins:](self, "setMargins:");
  [v4 floatForKey:@"small-margins"];
  -[BKLibraryBookshelfColumnMetrics setSmallMargins:](self, "setSmallMargins:");
  [v4 floatForKey:@"vertical"];
  -[BKLibraryBookshelfColumnMetrics setVertical:](self, "setVertical:");
  [v4 floatForKey:@"max-width"];
  -[BKLibraryBookshelfColumnMetrics setMaxWidth:](self, "setMaxWidth:");
  v5 = [v4 snapForKey:@"width-snap"];
  [(BKLibraryBookshelfColumnMetrics *)self setWidthSnap:v5];

  v6 = [v4 dictionaryForKey:@"columns"];
  [(BKLibraryBookshelfColumnMetrics *)self setColumns:v6];

  id v7 = [v4 integerForKey:@"small-columns"];

  [(BKLibraryBookshelfColumnMetrics *)self setSmallColumns:v7];
}

- (int64_t)columnsForContainingWidth:(double)a3
{
  v5 = [(BKLibraryBookshelfColumnMetrics *)self widthSnap];
  v6 = [v5 identifierForValue:a3];

  if (!v6) {
    goto LABEL_5;
  }
  objc_opt_class();
  id v7 = [(BKLibraryBookshelfColumnMetrics *)self columns];
  v8 = [v7 objectForKeyedSubscript:v6];
  v9 = BUDynamicCast();

  if (v9) {
    goto LABEL_4;
  }
  objc_opt_class();
  v10 = [(BKLibraryBookshelfColumnMetrics *)self columns];
  v11 = [v10 objectForKeyedSubscript:@"*"];
  v9 = BUDynamicCast();

  if (v9)
  {
LABEL_4:
    int64_t v12 = (int64_t)[v9 integerValue];
  }
  else
  {
LABEL_5:
    int64_t v12 = 4;
  }

  return v12;
}

- (NSString)description
{
  [(BKLibraryBookshelfColumnMetrics *)self gutter];
  uint64_t v4 = v3;
  [(BKLibraryBookshelfColumnMetrics *)self margins];
  uint64_t v6 = v5;
  [(BKLibraryBookshelfColumnMetrics *)self vertical];
  uint64_t v8 = v7;
  [(BKLibraryBookshelfColumnMetrics *)self maxWidth];
  uint64_t v10 = v9;
  v11 = [(BKLibraryBookshelfColumnMetrics *)self widthSnap];
  int64_t v12 = [(BKLibraryBookshelfColumnMetrics *)self columns];
  v13 = +[NSString stringWithFormat:@"BKLibraryBookshelfColumnMetrics: gutter: %f, margins: %f, vertical: %f, maxWidth: %f, widthSnap: %@, columns: %@", v4, v6, v8, v10, v11, v12];

  return (NSString *)v13;
}

- (double)gutter
{
  return self->_gutter;
}

- (void)setGutter:(double)a3
{
  self->_gutter = a3;
}

- (double)smallGutter
{
  return self->_smallGutter;
}

- (void)setSmallGutter:(double)a3
{
  self->_smallGutter = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)smallMargins
{
  return self->_smallMargins;
}

- (void)setSmallMargins:(double)a3
{
  self->_smallMargins = a3;
}

- (double)vertical
{
  return self->_vertical;
}

- (void)setVertical:(double)a3
{
  self->_vertical = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (TUISnap)widthSnap
{
  return self->_widthSnap;
}

- (void)setWidthSnap:(id)a3
{
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (int64_t)smallColumns
{
  return self->_smallColumns;
}

- (void)setSmallColumns:(int64_t)a3
{
  self->_smallColumns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_widthSnap, 0);
}

@end