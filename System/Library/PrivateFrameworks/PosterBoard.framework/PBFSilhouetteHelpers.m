@interface PBFSilhouetteHelpers
+ (id)makeHomeScreenSilhouetteViewWithLayout:(id)a3 includeDock:(BOOL)a4 displayContext:(id)a5 viewScreenSizeScale:(double)a6;
- (PBFSilhouetteHelpers)init;
@end

@implementation PBFSilhouetteHelpers

+ (id)makeHomeScreenSilhouetteViewWithLayout:(id)a3 includeDock:(BOOL)a4 displayContext:(id)a5 viewScreenSizeScale:(double)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = _s11PosterBoard17SilhouetteHelpersC014makeHomeScreenC4View6layout11includeDock14displayContext04viewG9SizeScaleSo6UIViewCSgSo07SBSHomegC6LayoutC_SbSo010PBFDisplayM0_pSg12CoreGraphics7CGFloatVtFZ_0((uint64_t)v9, a4, a5, a6);

  swift_unknownObjectRelease();
  return v10;
}

- (PBFSilhouetteHelpers)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SilhouetteHelpers();
  return [(PBFSilhouetteHelpers *)&v3 init];
}

@end