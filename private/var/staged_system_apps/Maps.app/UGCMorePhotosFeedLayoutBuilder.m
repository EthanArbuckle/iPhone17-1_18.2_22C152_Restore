@interface UGCMorePhotosFeedLayoutBuilder
+ (id)_loadingSection;
+ (id)_thumbnailGalleryLayoutForPadPortrait;
+ (id)_thumbnailGalleryLayoutForPhoneLandscape;
+ (id)_thumbnailGalleryLayoutForPhonePortrait;
+ (id)_thumbnailGalleryLayoutForTraitCollection:(id)a3;
+ (id)thumbnailGalleryLayoutForTraitCollection:(id)a3;
@end

@implementation UGCMorePhotosFeedLayoutBuilder

+ (id)thumbnailGalleryLayoutForTraitCollection:(id)a3
{
  id v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  [v4 setContentInsetsReference:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AE785C;
  v7[3] = &unk_101317110;
  v7[4] = a1;
  id v5 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v7 configuration:v4];

  return v5;
}

+ (id)_thumbnailGalleryLayoutForTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInterfaceIdiom];
  v6 = +[UIDevice currentDevice];
  v7 = (char *)[v6 orientation];

  if (v5 == (id)5)
  {
    uint64_t v8 = [a1 _thumbnailGalleryLayoutForMacOS];
  }
  else if (v5 == (id)1)
  {
    if ((unint64_t)(v7 - 1) > 1) {
      [a1 _thumbnailGalleryLayoutForPadLandscape];
    }
    else {
    uint64_t v8 = [a1 _thumbnailGalleryLayoutForPadPortrait];
    }
  }
  else if (v5 || [v4 verticalSizeClass] != (id)1)
  {
    uint64_t v8 = [a1 _thumbnailGalleryLayoutForPhonePortrait];
  }
  else
  {
    uint64_t v8 = [a1 _thumbnailGalleryLayoutForPhoneLandscape];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)_thumbnailGalleryLayoutForPadPortrait
{
  v29 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.75 fractionalHeight:1.0];
  v2 = +[NSCollectionLayoutItem itemWithLayoutSize:v29];
  [v2 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v30 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeight:0.333333343];
  v28 = +[NSCollectionLayoutItem itemWithLayoutSize:v30];
  [v28 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v18 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.25 fractionalHeight:1.0];
  v26 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v18 repeatingSubitem:v28 count:3];
  v27 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:1.0];
  v23 = +[NSCollectionLayoutItem itemWithLayoutSize:v27];
  [v23 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v25 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.75];
  v34[0] = v26;
  v34[1] = v2;
  v22 = v2;
  v3 = +[NSArray arrayWithObjects:v34 count:2];
  v20 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v25 subitems:v3];

  v24 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.25 fractionalHeight:1.0];
  id v4 = +[NSCollectionLayoutItem itemWithLayoutSize:v24];
  [v4 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v21 = +[NSCollectionLayoutItem itemWithLayoutSize:v24];
  [v21 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v19 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.25];
  v33[0] = v4;
  v33[1] = v4;
  v33[2] = v4;
  v33[3] = v21;
  id v5 = +[NSArray arrayWithObjects:v33 count:4];
  v17 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v19 subitems:v5];

  v16 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.75];
  id v6 = [v2 copy];
  [v6 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v7 = +[NSCollectionLayoutItem itemWithLayoutSize:v30];
  [v7 setContentInsets:0.0, 0.0, 2.0, 0.0];
  uint64_t v8 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v18 repeatingSubitem:v7 count:3];
  v32[0] = v6;
  v32[1] = v8;
  v9 = +[NSArray arrayWithObjects:v32 count:2];
  v10 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v16 subitems:v9];

  v11 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:2.75];
  v31[0] = v23;
  v31[1] = v20;
  v31[2] = v17;
  v31[3] = v10;
  v12 = +[NSArray arrayWithObjects:v31 count:4];
  v13 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v11 subitems:v12];

  v14 = +[NSCollectionLayoutSection sectionWithGroup:v13];

  return v14;
}

+ (id)_thumbnailGalleryLayoutForPhoneLandscape
{
  v37 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.666666687 fractionalHeight:1.0];
  v2 = +[NSCollectionLayoutItem itemWithLayoutSize:v37];
  [v2 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v36 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeight:0.5];
  v33 = +[NSCollectionLayoutItem itemWithLayoutSize:v36];
  [v33 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v35 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.5 fractionalHeight:1.0];
  v3 = +[NSCollectionLayoutItem itemWithLayoutSize:v35];
  [v3 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v34 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeight:0.5];
  v30 = v3;
  id v4 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v34 repeatingSubitem:v3 count:2];
  id v5 = +[NSCollectionLayoutSpacing fixedSpacing:2.0];
  v32 = v4;
  [v4 setInterItemSpacing:v5];

  v31 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.333333343 fractionalHeight:1.0];
  v42[0] = v33;
  v42[1] = v4;
  id v6 = +[NSArray arrayWithObjects:v42 count:2];
  v7 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v31 subitems:v6];

  [v3 setContentInsets:0.0, 0.0, 0.0, 2.0];
  uint64_t v8 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.333333343];
  v9 = v2;
  v28 = v2;
  v41[0] = v2;
  v41[1] = v7;
  v26 = v7;
  v10 = +[NSArray arrayWithObjects:v41 count:2];
  v24 = (void *)v8;
  v27 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v8 subitems:v10];

  v29 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.166666672 fractionalHeight:1.0];
  v11 = +[NSCollectionLayoutItem itemWithLayoutSize:v29];
  [v11 setContentInsets:0.0, 0.0, 2.0, 2.0];
  id v12 = [v11 copy];
  [v12 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v25 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.166666672];
  v40[0] = v11;
  v40[1] = v11;
  v40[2] = v11;
  v40[3] = v11;
  v40[4] = v11;
  v40[5] = v12;
  v13 = +[NSArray arrayWithObjects:v40 count:6];
  v14 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v25 subitems:v13];

  id v15 = [v9 copy];
  [v15 setContentInsets:0.0, 0.0, 2.0, 0.0];
  id v16 = [v7 copy];
  [v16 setContentInsets:0.0, 0.0, 0.0, 2.0];
  v39[0] = v16;
  v39[1] = v15;
  v17 = +[NSArray arrayWithObjects:v39 count:2];
  v18 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v8 subitems:v17];

  v19 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:3.0];
  v38[0] = v27;
  v38[1] = v14;
  v38[2] = v18;
  v38[3] = v14;
  v20 = +[NSArray arrayWithObjects:v38 count:4];
  v21 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v19 subitems:v20];

  v22 = +[NSCollectionLayoutSection sectionWithGroup:v21];

  return v22;
}

+ (id)_thumbnailGalleryLayoutForPhonePortrait
{
  v34 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.666666687 fractionalHeight:1.0];
  v2 = +[NSCollectionLayoutItem itemWithLayoutSize:v34];
  [v2 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v33 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeight:0.5];
  v3 = +[NSCollectionLayoutItem itemWithLayoutSize:v33];
  [v3 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v21 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.333333343 fractionalHeight:1.0];
  v25 = v3;
  v31 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v21 repeatingSubitem:v3 count:2];
  v32 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:1.0];
  v27 = +[NSCollectionLayoutItem itemWithLayoutSize:v32];
  [v27 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v30 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.666666687];
  v38[0] = v31;
  v38[1] = v2;
  id v4 = v2;
  v28 = v2;
  id v5 = +[NSArray arrayWithObjects:v38 count:2];
  v24 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v30 subitems:v5];

  v29 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:0.333333343 fractionalHeight:1.0];
  id v6 = +[NSCollectionLayoutItem itemWithLayoutSize:v29];
  [v6 setContentInsets:0.0, 0.0, 2.0, 2.0];
  v26 = +[NSCollectionLayoutItem itemWithLayoutSize:v29];
  [v26 setContentInsets:0.0, 0.0, 2.0, 0.0];
  +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.333333343];
  v23 = v22 = v6;
  v37[0] = v6;
  v37[1] = v6;
  v37[2] = v26;
  v7 = +[NSArray arrayWithObjects:v37 count:3];
  uint64_t v8 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v23 subitems:v7];

  v20 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:0.666666687];
  id v9 = [v4 copy];
  [v9 setContentInsets:0.0, 0.0, 2.0, 2.0];
  id v10 = [v3 copy];
  [v10 setContentInsets:0.0, 0.0, 2.0, 0.0];
  v11 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v21 repeatingSubitem:v10 count:2];
  v36[0] = v9;
  v36[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v36 count:2];
  v13 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v20 subitems:v12];

  v14 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 fractionalHeightUsingWidth:2.66666675];
  v35[0] = v27;
  v35[1] = v24;
  v35[2] = v8;
  v35[3] = v13;
  id v15 = (void *)v8;
  id v16 = +[NSArray arrayWithObjects:v35 count:4];
  v17 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v14 subitems:v16];

  v18 = +[NSCollectionLayoutSection sectionWithGroup:v17];

  return v18;
}

+ (id)_loadingSection
{
  v2 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:1.0 height:50.0];
  v3 = +[NSCollectionLayoutItem itemWithLayoutSize:v2];
  uint64_t v8 = v3;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  id v5 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v2 subitems:v4];

  id v6 = +[NSCollectionLayoutSection sectionWithGroup:v5];

  return v6;
}

@end