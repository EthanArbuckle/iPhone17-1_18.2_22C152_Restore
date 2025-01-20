@interface TUISmartGridDebugRenderModel
+ (id)renderModelWithSize:(CGSize)a3 columnSystem:(ColumnSystem *)a4 identifier:(id)a5 transform:(CGAffineTransform *)a6;
@end

@implementation TUISmartGridDebugRenderModel

+ (id)renderModelWithSize:(CGSize)a3 columnSystem:(ColumnSystem *)a4 identifier:(id)a5 transform:(CGAffineTransform *)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  v11 = -[_TUISmartGridDebugLayerConfiguration initWithSize:columnSystem:]([_TUISmartGridDebugLayerConfiguration alloc], "initWithSize:columnSystem:", a4, width, height);
  v12 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v13 = [v10 tui_identifierByAppendingString:@"debug"];
  v14 = +[TUILayerContainerView renderModelWithLayerModel:v12 identifier:v13];

  v15 = [[TUIRenderModelTransform alloc] initWithSubmodel:v14];
  -[TUIRenderModelTransform setSize:](v15, "setSize:", width, height);
  -[TUIRenderModelTransform setCenter:](v15, "setCenter:", width * 0.5, height * 0.5);
  long long v16 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a6->tx;
  [(TUIRenderModelTransform *)v15 setTransform:v18];
  [(TUIRenderModelTransform *)v15 setZIndex:1000];

  return v15;
}

@end