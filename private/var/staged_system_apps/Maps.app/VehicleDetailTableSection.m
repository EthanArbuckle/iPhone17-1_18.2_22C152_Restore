@interface VehicleDetailTableSection
- (NSArray)cells;
- (NSString)footerText;
- (NSString)headerTitle;
- (VehicleDetailTableSection)initWithCells:(id)a3;
- (void)setCells:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setHeaderTitle:(id)a3;
@end

@implementation VehicleDetailTableSection

- (VehicleDetailTableSection)initWithCells:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VehicleDetailTableSection;
  v5 = [(VehicleDetailTableSection *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    cells = v5->_cells;
    v5->_cells = v6;
  }
  return v5;
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);

  objc_storeStrong((id *)&self->_cells, 0);
}

@end