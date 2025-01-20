@interface CarFocusContainerGuideController
- (CarFocusContainerGuideController)initWithHostView:(id)a3;
- (NSDictionary)focusContainerGuidesByEdge;
- (id)_addGuideForEdge:(unint64_t)a3;
- (unint64_t)activeEdges;
- (void)setActiveEdges:(unint64_t)a3;
- (void)setFocusContainerGuidesByEdge:(id)a3;
@end

@implementation CarFocusContainerGuideController

- (CarFocusContainerGuideController)initWithHostView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarFocusContainerGuideController;
  v5 = [(CarFocusContainerGuideController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostView, v4);
  }

  return v6;
}

- (id)_addGuideForEdge:(unint64_t)a3
{
  v5 = objc_alloc_init(CarFocusContainerGuide);
  p_hostView = &self->_hostView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
  [WeakRetained addLayoutGuide:v5];

  id v8 = objc_loadWeakRetained((id *)p_hostView);
  v9 = [v8 safeAreaLayoutGuide];

  v10 = +[NSMutableArray array];
  switch(a3)
  {
    case 1uLL:
      v36 = [(CarFocusContainerGuide *)v5 topAnchor];
      v35 = [v9 topAnchor];
      v34 = [v36 constraintEqualToAnchor:v35];
      v42[0] = v34;
      v33 = [(CarFocusContainerGuide *)v5 leftAnchor];
      v32 = [v9 leftAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v42[1] = v31;
      v11 = [(CarFocusContainerGuide *)v5 rightAnchor];
      v12 = [v9 rightAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v42[2] = v13;
      v14 = [(CarFocusContainerGuide *)v5 heightAnchor];
      v15 = [v14 constraintEqualToConstant:30.0];
      v42[3] = v15;
      v16 = +[NSArray arrayWithObjects:v42 count:4];
      [v10 addObjectsFromArray:v16];

      v17 = v36;
      goto LABEL_9;
    case 2uLL:
      v37 = [(CarFocusContainerGuide *)v5 topAnchor];
      v35 = [v9 topAnchor];
      v34 = [v37 constraintEqualToAnchor:v35];
      v41[0] = v34;
      v33 = [(CarFocusContainerGuide *)v5 leftAnchor];
      v32 = [v9 leftAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v41[1] = v31;
      v11 = [(CarFocusContainerGuide *)v5 bottomAnchor];
      v12 = [v9 bottomAnchor];
      v18 = [v11 constraintEqualToAnchor:v12];
      v41[2] = v18;
      v19 = [(CarFocusContainerGuide *)v5 widthAnchor];
      v20 = [v19 constraintEqualToConstant:30.0];
      v41[3] = v20;
      v21 = v41;
      goto LABEL_8;
    case 4uLL:
      v37 = [(CarFocusContainerGuide *)v5 leftAnchor];
      v35 = [v9 leftAnchor];
      v34 = [v37 constraintEqualToAnchor:v35];
      v39[0] = v34;
      v33 = [(CarFocusContainerGuide *)v5 rightAnchor];
      v32 = [v9 rightAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v39[1] = v31;
      v11 = [(CarFocusContainerGuide *)v5 bottomAnchor];
      v12 = [v9 bottomAnchor];
      v18 = [v11 constraintEqualToAnchor:v12];
      v39[2] = v18;
      v19 = [(CarFocusContainerGuide *)v5 heightAnchor];
      v20 = [v19 constraintEqualToConstant:30.0];
      v39[3] = v20;
      v21 = v39;
      goto LABEL_8;
    case 8uLL:
      v37 = [(CarFocusContainerGuide *)v5 topAnchor];
      v35 = [v9 topAnchor];
      v34 = [v37 constraintEqualToAnchor:v35];
      v40[0] = v34;
      v33 = [(CarFocusContainerGuide *)v5 rightAnchor];
      v32 = [v9 rightAnchor];
      v31 = [v33 constraintEqualToAnchor:v32];
      v40[1] = v31;
      v11 = [(CarFocusContainerGuide *)v5 bottomAnchor];
      v12 = [v9 bottomAnchor];
      v18 = [v11 constraintEqualToAnchor:v12];
      v40[2] = v18;
      v19 = [(CarFocusContainerGuide *)v5 widthAnchor];
      v20 = [v19 constraintEqualToConstant:30.0];
      v40[3] = v20;
      v21 = v40;
LABEL_8:
      v22 = +[NSArray arrayWithObjects:v21 count:4];
      [v10 addObjectsFromArray:v22];

      v17 = v37;
LABEL_9:

      break;
    default:
      v17 = sub_100015DB4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Tried to create focus container guide for invalid edge.", buf, 2u);
      }
      break;
  }

  id v23 = objc_loadWeakRetained((id *)p_hostView);
  [v23 addConstraints:v10];

  v24 = +[NSUserDefaults standardUserDefaults];
  unsigned int v25 = [v24 BOOLForKey:@"__internal_CarVisualizeFocusGuidesDebug"];

  if (v25)
  {
    id v26 = objc_loadWeakRetained((id *)p_hostView);
    v27 = [(CarFocusContainerGuide *)v5 debugView];
    [v26 addSubview:v27];

    id v28 = objc_loadWeakRetained((id *)p_hostView);
    v29 = [(CarFocusContainerGuide *)v5 activationConstraints];
    [v28 addConstraints:v29];
  }

  return v5;
}

- (NSDictionary)focusContainerGuidesByEdge
{
  focusContainerGuidesByEdge = self->_focusContainerGuidesByEdge;
  if (!focusContainerGuidesByEdge)
  {
    v11[0] = &off_1013A8C68;
    id v4 = [(CarFocusContainerGuideController *)self _addGuideForEdge:1];
    v12[0] = v4;
    v11[1] = &off_1013A8C80;
    v5 = [(CarFocusContainerGuideController *)self _addGuideForEdge:2];
    v12[1] = v5;
    v11[2] = &off_1013A8C98;
    v6 = [(CarFocusContainerGuideController *)self _addGuideForEdge:8];
    v12[2] = v6;
    v11[3] = &off_1013A8CB0;
    v7 = [(CarFocusContainerGuideController *)self _addGuideForEdge:4];
    v12[3] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
    v9 = self->_focusContainerGuidesByEdge;
    self->_focusContainerGuidesByEdge = v8;

    focusContainerGuidesByEdge = self->_focusContainerGuidesByEdge;
  }

  return focusContainerGuidesByEdge;
}

- (void)setActiveEdges:(unint64_t)a3
{
  if (self->_activeEdges != a3)
  {
    self->_activeEdges = a3;
    unint64_t v4 = a3 & 1;
    v5 = [(CarFocusContainerGuideController *)self focusContainerGuidesByEdge];
    v6 = [v5 objectForKeyedSubscript:&off_1013A8C68];
    [v6 setEnabled:v4];

    unint64_t v7 = (self->_activeEdges >> 1) & 1;
    id v8 = [(CarFocusContainerGuideController *)self focusContainerGuidesByEdge];
    v9 = [v8 objectForKeyedSubscript:&off_1013A8C80];
    [v9 setEnabled:v7];

    unint64_t v10 = (self->_activeEdges >> 3) & 1;
    v11 = [(CarFocusContainerGuideController *)self focusContainerGuidesByEdge];
    v12 = [v11 objectForKeyedSubscript:&off_1013A8C98];
    [v12 setEnabled:v10];

    unint64_t v13 = (self->_activeEdges >> 2) & 1;
    id v15 = [(CarFocusContainerGuideController *)self focusContainerGuidesByEdge];
    v14 = [v15 objectForKeyedSubscript:&off_1013A8CB0];
    [v14 setEnabled:v13];
  }
}

- (unint64_t)activeEdges
{
  return self->_activeEdges;
}

- (void)setFocusContainerGuidesByEdge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusContainerGuidesByEdge, 0);

  objc_destroyWeak((id *)&self->_hostView);
}

@end