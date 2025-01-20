@interface SBMutableDodgingModel
- (void)addIdentifier:(id)a3 atIndex:(unint64_t)a4 center:(CGPoint)a5 size:(CGSize)a6;
- (void)bringIdentifierToFront:(id)a3;
- (void)removeIdentifier:(id)a3;
- (void)setCenter:(CGPoint)a3 forIdentifier:(id)a4;
- (void)setIndex:(unint64_t)a3 forIdentifier:(id)a4;
- (void)setReferenceBounds:(CGRect)a3;
- (void)setSize:(CGSize)a3 forIdentifier:(id)a4;
@end

@implementation SBMutableDodgingModel

- (void)bringIdentifierToFront:(id)a3
{
}

- (void)setIndex:(unint64_t)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SBDodgingModel *)self identifiers];
  [v7 removeObject:v6];
  [v7 insertObject:v6 atIndex:a3];
}

- (void)removeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SBDodgingModel *)self identifiers];
  [v5 removeObject:v4];

  id v6 = [(SBDodgingModel *)self centersForIdentifiers];
  [v6 removeObjectForKey:v4];

  id v7 = [(SBDodgingModel *)self sizesForIdentifiers];
  [v7 removeObjectForKey:v4];
}

- (void)addIdentifier:(id)a3 atIndex:(unint64_t)a4 center:(CGPoint)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v13 = a3;
  v12 = [(SBDodgingModel *)self identifiers];
  [v12 insertObject:v13 atIndex:a4];

  -[SBMutableDodgingModel setCenter:forIdentifier:](self, "setCenter:forIdentifier:", v13, x, y);
  -[SBMutableDodgingModel setSize:forIdentifier:](self, "setSize:forIdentifier:", v13, width, height);
}

- (void)setCenter:(CGPoint)a3 forIdentifier:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(SBDodgingModel *)self centersForIdentifiers];
  id v11 = v7;
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v8 addEntriesFromDictionary:v10];
}

- (void)setSize:(CGSize)a3 forIdentifier:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(SBDodgingModel *)self sizesForIdentifiers];
  id v11 = v7;
  v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v8 addEntriesFromDictionary:v10];
}

- (void)setReferenceBounds:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBMutableDodgingModel;
  -[SBDodgingModel setReferenceBounds:](&v3, sel_setReferenceBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end