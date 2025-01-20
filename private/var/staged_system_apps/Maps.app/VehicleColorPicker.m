@interface VehicleColorPicker
- (NSArray)cells;
- (NSArray)colors;
- (VehicleColorPicker)initWithColors:(id)a3 colorsPerRow:(unint64_t)a4 colorEdgeInsets:(UIEdgeInsets)a5 selectedIndex:(id)a6 contrastColor:(id)a7 delegate:(id)a8;
- (VehicleColorPickerDelegate)delegate;
- (void)pressedCell:(id)a3;
- (void)setCells:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation VehicleColorPicker

- (VehicleColorPicker)initWithColors:(id)a3 colorsPerRow:(unint64_t)a4 colorEdgeInsets:(UIEdgeInsets)a5 selectedIndex:(id)a6 contrastColor:(id)a7 delegate:(id)a8
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  id v17 = a3;
  id v18 = a6;
  id v62 = a7;
  id v19 = a8;
  v77.receiver = self;
  v77.super_class = (Class)VehicleColorPicker;
  v20 = -[VehicleColorPicker initWithFrame:](&v77, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v20)
  {
    v21 = (NSArray *)[v17 copy];
    colors = v20->_colors;
    v20->_colors = v21;

    v20->_colorsPerRow = a4;
    v20->_colorEdgeInsets.CGFloat top = top;
    v20->_colorEdgeInsets.CGFloat left = left;
    v20->_colorEdgeInsets.CGFloat bottom = bottom;
    v20->_colorEdgeInsets.CGFloat right = right;
    objc_storeStrong((id *)&v20->_contrastColor, a7);
    objc_storeWeak((id *)&v20->_delegate, v19);
    v23 = (NSNumber *)[v18 copy];
    selectedIndex = v20->_selectedIndex;
    v20->_selectedIndex = v23;

    v72 = objc_opt_new();
    unint64_t v25 = (unint64_t)[v17 count];
    unint64_t v70 = v25;
    if (v25 % a4) {
      unint64_t v26 = v25 / a4 + 1;
    }
    else {
      unint64_t v26 = v25 / a4;
    }
    uint64_t v27 = [(VehicleColorPicker *)v20 topAnchor];
    v28 = (void *)v27;
    id v60 = v18;
    id v61 = v17;
    if (v26)
    {
      unint64_t v29 = 0;
      uint64_t v30 = 0;
      unint64_t v65 = a4 - 1;
      unint64_t v66 = a4;
      v67 = v20;
      unint64_t v63 = v26;
      do
      {
        v31 = 0;
        if (v29 >= v70)
        {
          v51 = 0;
        }
        else
        {
          uint64_t v64 = v30;
          unint64_t v32 = 0;
          v33 = 0;
          v31 = 0;
          v68 = v28;
          unint64_t v69 = v29;
          do
          {
            v34 = [(VehicleColorPicker *)v20 cells];
            v35 = [v34 objectAtIndexedSubscript:v29 + v32];

            [(VehicleColorPicker *)v20 addSubview:v35];
            v76 = v33;
            if (v32)
            {
              v71 = [v35 leadingAnchor];
              v36 = [v71 constraintEqualToAnchor:v33];
              v79[0] = v36;
              v37 = [v35 topAnchor];
              v74 = [v37 constraintEqualToAnchor:v28];
              v79[1] = v74;
              v38 = [v35 widthAnchor];
              v39 = [v31 widthAnchor];
              v73 = v38;
              v40 = [v38 constraintEqualToAnchor:v39];
              v79[2] = v40;
              v41 = [v35 heightAnchor];
              id v75 = v31;
              v42 = [v31 heightAnchor];
              v43 = [v41 constraintEqualToAnchor:v42];
              v79[3] = v43;
              v44 = +[NSArray arrayWithObjects:v79 count:4];
              [v72 addObjectsFromArray:v44];

              v45 = v71;
            }
            else
            {
              id v46 = v35;

              v45 = [v46 leadingAnchor];
              v36 = [(VehicleColorPicker *)v20 leadingAnchor];
              v37 = [v45 constraintEqualToAnchor:v36];
              v80[0] = v37;
              v74 = [v46 topAnchor];
              v73 = [v74 constraintEqualToAnchor:v28];
              v80[1] = v73;
              v39 = [v46 widthAnchor];
              v40 = [v46 heightAnchor];
              v41 = [v39 constraintEqualToAnchor:v40];
              v80[2] = v41;
              v42 = +[NSArray arrayWithObjects:v80 count:3];
              [v72 addObjectsFromArray:v42];
              id v75 = v46;
            }

            v20 = v67;
            if (v65 == v32)
            {
              v47 = [v35 trailingAnchor];
              v48 = [(VehicleColorPicker *)v67 trailingAnchor];
              v49 = [v47 constraintEqualToAnchor:v48];
              v78 = v49;
              v50 = +[NSArray arrayWithObjects:&v78 count:1];
              [v72 addObjectsFromArray:v50];
            }
            v51 = [v35 trailingAnchor];

            ++v32;
            v28 = v68;
            unint64_t v29 = v69;
            v31 = v75;
            if (v32 >= v66) {
              break;
            }
            v33 = v51;
          }
          while (v32 + v69 < v70);
          unint64_t v29 = v69 + v32;
          unint64_t v26 = v63;
          uint64_t v30 = v64;
        }
        v52 = [v31 bottomAnchor];

        ++v30;
        v28 = v52;
      }
      while (v30 != v26);
    }
    else
    {
      v52 = (void *)v27;
    }
    v53 = [(VehicleColorPicker *)v20 cells];
    v54 = [v53 lastObject];

    v55 = [v54 bottomAnchor];
    v56 = [(VehicleColorPicker *)v20 bottomAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    [v72 addObject:v57];

    +[NSLayoutConstraint activateConstraints:v72];
    id v18 = v60;
    id v17 = v61;
    id v19 = v59;
  }

  return v20;
}

- (NSArray)cells
{
  cells = self->_cells;
  if (!cells)
  {
    v4 = (NSArray *)objc_opt_new();
    v5 = [(VehicleColorPicker *)self colors];
    id v6 = [v5 count];

    if (v6)
    {
      v7 = 0;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      do
      {
        v11 = -[VehiclePickerButton initWithFrame:]([VehiclePickerButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
        v12 = [(VehicleColorPicker *)self colors];
        v13 = [v12 objectAtIndexedSubscript:v7];

        [(VehiclePickerButton *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(VehiclePickerButton *)v11 setAccessibilityIdentifier:@"VehiclePickerButton"];
        v14 = [(VehiclePickerButton *)v11 colorView];
        [v14 setBackgroundColor:v13];

        -[VehiclePickerButton setColorViewInsets:](v11, "setColorViewInsets:", self->_colorEdgeInsets.top, self->_colorEdgeInsets.left, self->_colorEdgeInsets.bottom, self->_colorEdgeInsets.right);
        selectedIndex = self->_selectedIndex;
        if (selectedIndex) {
          BOOL v16 = v7 == (char *)[(NSNumber *)selectedIndex unsignedIntegerValue];
        }
        else {
          BOOL v16 = 0;
        }
        [(VehiclePickerButton *)v11 setActive:v16];
        [v13 _maps_euclideanDistanceFromColor:self->_contrastColor];
        [(VehiclePickerButton *)v11 setNeedsOutlineStroke:v17 < 0.1];
        [(VehiclePickerButton *)v11 addTarget:self action:"pressedCell:" forControlEvents:64];
        [(NSArray *)v4 addObject:v11];

        ++v7;
        id v18 = [(VehicleColorPicker *)self colors];
        id v19 = (char *)[v18 count];
      }
      while (v7 < v19);
    }
    v20 = self->_cells;
    self->_cells = v4;

    cells = self->_cells;
  }

  return cells;
}

- (void)pressedCell:(id)a3
{
  id v4 = a3;
  v5 = [(VehicleColorPicker *)self delegate];
  id v6 = [(VehicleColorPicker *)self cells];
  [v5 colorPicker:self didSelectIndex:[v6 indexOfObject:v4]];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = [(VehicleColorPicker *)self cells];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setActive:0];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v4 setActive:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VehicleColorPicker;
  [(VehicleColorPicker *)&v21 traitCollectionDidChange:v4];
  v5 = [(VehicleColorPicker *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [(VehicleColorPicker *)self cells];
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v14 = [v13 colorView];
          long long v15 = [v14 backgroundColor];
          [v15 _maps_euclideanDistanceFromColor:self->_contrastColor];
          [v13 setNeedsOutlineStroke:v16 < 0.1];
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (NSArray)colors
{
  return self->_colors;
}

- (VehicleColorPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VehicleColorPickerDelegate *)WeakRetained;
}

- (void)setCells:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cells, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_contrastColor, 0);

  objc_storeStrong((id *)&self->_selectedIndex, 0);
}

@end