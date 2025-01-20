@interface _TUIFeedSectionModel
- (BOOL)invalidateViewAtIndexPath:(id)a3;
- (BOOL)visible;
- (TUIMutableViewState)currentViewState;
- (TUIRenderModelSection)previousRenderModel;
- (TUIRenderModelSection)renderModel;
- (id).cxx_construct;
- (id)visibleViewAtIndexPath:(id)a3;
- (int64_t)semanticContentAttribute;
- (unint64_t)sectionIndex;
- (void)appendRenderOverrideObservers:(id)a3;
- (void)appendVisibleView:(id)a3;
- (void)resumeReuseOfView:(id)a3;
- (void)setCurrentViewState:(id)a3;
- (void)setPreviousRenderModel:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)suspendReuseOfView:(id)a3;
- (void)updateInvalidatedWithHost:(id)a3 liveTransformResolver:(id)a4 factory:(id)a5 feedView:(id)a6;
- (void)updateVisible:(BOOL)a3 bounds:(CGRect)a4 host:(id)a5 liveTransformResolver:(id)a6 factory:(id)a7 feedView:(id)a8;
@end

@implementation _TUIFeedSectionModel

- (void)appendVisibleView:(id)a3
{
  for (i = self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
    [a3 addObject:i[3]];
}

- (void)appendRenderOverrideObservers:(id)a3
{
  for (i = (id *)self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
    [i[3] appendRenderOverrideObservers:a3];
}

- (void)updateVisible:(BOOL)a3 bounds:(CGRect)a4 host:(id)a5 liveTransformResolver:(id)a6 factory:(id)a7 feedView:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v90 = a3;
  id v16 = a5;
  id v92 = a6;
  id v100 = a7;
  id v97 = a8;
  v106 = self;
  v99 = v16;
  sub_131668((uint64_t)v125, (uint64_t)&self->_reuseSuspendedViews);
  v95 = [v16 tui_hostingView];
  v96 = [v97 subviewsDelegate];
  v17 = objc_opt_new();
  v91 = v17;
  -[TUIRenderModelSection appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self->_renderModel, "appendLiveTransformLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v17, v92, x, y, width, height);
  if (v90) {
    -[TUIRenderModelSection appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:](self->_renderModel, "appendLayoutAttributes:forElementsInRect:withLiveTransformResolver:", v17, v92, x, y, width, height);
  }
  if ([v17 count])
  {
    v18 = [v97 impressionSnapshot];
    BOOL v19 = v18 == 0;

    if (!v19)
    {
      renderModel = self->_renderModel;
      v21 = [v97 impressionSnapshot];
      -[TUIRenderModelSection appendImpressionLayoutAttributes:forElementsInRect:snapshot:](renderModel, "appendImpressionLayoutAttributes:forElementsInRect:snapshot:", v91, v21, x, y, width, height);
    }
    v22 = [v97 overrides];
    BOOL v23 = v22 == 0;

    if (!v23) {
      [v97 _updateLayoutAttributes:v91];
    }
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obj = v91;
    id v24 = [obj countByEnumeratingWithState:&v121 objects:v140 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v122;
      p_visibleViews = &self->_visibleViews;
      p_invalidatedViews = &self->_invalidatedViews;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v122 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          v28 = [v27 indexPath];
          id v120 = 0;
          v108 = v28;
          id v120 = [v28 tui_row];
          v107 = [(TUIRenderModelSection *)v106->_renderModel viewModelWithIndex:v120];
          v29 = [v107 submodel];
          v30 = [v29 reuseIdentifier];

          v31 = sub_1318FC(p_visibleViews, (unint64_t *)&v120);
          v32 = v31;
          if (v107)
          {
            if (v31)
            {
              v33 = [(id)v31[3] reuseIdentifier];
              if (v33 == v30)
              {

LABEL_31:
                uint64_t v43 = v32[3];
                *(void *)buf = &v120;
                sub_1319B0((uint64_t)v125, (unint64_t *)&v120, (uint64_t)&std::piecewise_construct, (void **)buf)[3] = v43;
                sub_34E00(p_visibleViews, v32);
                goto LABEL_32;
              }
              v34 = [(id)v32[3] reuseIdentifier];
              unsigned __int8 v35 = [v34 isEqualToString:v30];

              if (v35) {
                goto LABEL_31;
              }
              if (_TUIDeviceHasInternalInstall())
              {
                id v55 = (id)v32[3];
                v102 = v55;
                v56 = TUIDefaultLog();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  unint64_t v58 = (unint64_t)v120;
                  v104 = [v55 layoutAttributes];
                  v59 = [v104 renderModel];
                  v60 = [v59 identifier];
                  v61 = [v60 tui_identifierToString];
                  v62 = [v55 reuseIdentifier];
                  v63 = [(TUIRenderModelSection *)v106->_renderModel viewModelWithIndex:v120];
                  v64 = [v63 identifier];
                  v65 = [v64 tui_identifierToString];
                  *(_DWORD *)buf = 134219010;
                  *(void *)&buf[4] = v58;
                  __int16 v132 = 2112;
                  v133 = v61;
                  __int16 v134 = 2112;
                  v135 = v62;
                  __int16 v136 = 2112;
                  v137 = v65;
                  __int16 v138 = 2112;
                  v139 = v30;
                  _os_log_error_impl(&def_141F14, v56, OS_LOG_TYPE_ERROR, "[%lu] view re-used with mismatching reuseIdentifier (%@,%@) vs (%@,%@)", buf, 0x34u);
                }
                for (j = v106->_reuseSuspendedViews.__table_.__p1_.__value_.__next_; j; j = (void *)*j)
                {
                  uint64_t v82 = j[2];
                  v83 = (void *)j[3];
                  v84 = TUIDefaultLog();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                  {
                    v85 = [v83 layoutAttributes];
                    v86 = [v85 renderModel];
                    v87 = [v86 identifier];
                    v88 = [v87 tui_identifierToString];
                    v89 = [v83 reuseIdentifier];
                    *(_DWORD *)buf = 134218498;
                    *(void *)&buf[4] = v82;
                    __int16 v132 = 2112;
                    v133 = v88;
                    __int16 v134 = 2112;
                    v135 = v89;
                    _os_log_error_impl(&def_141F14, v84, OS_LOG_TYPE_ERROR, "[%lu] suspended reuse (%@,%@)", buf, 0x20u);
                  }
                }
                id v67 = objc_alloc((Class)NSException);
                v130[0] = v108;
                v129[0] = @"indexPath";
                v129[1] = @"viewIdentifier";
                v68 = [v102 layoutAttributes];
                v69 = [v68 renderModel];
                v70 = [v69 identifier];
                uint64_t v71 = [v70 tui_identifierToString];
                v72 = (void *)v71;
                if (v71) {
                  CFStringRef v73 = (const __CFString *)v71;
                }
                else {
                  CFStringRef v73 = @"nil";
                }
                v130[1] = v73;
                v129[2] = @"viewReuseIdentifier";
                uint64_t v74 = [v102 reuseIdentifier];
                v75 = (void *)v74;
                if (v74) {
                  CFStringRef v76 = (const __CFString *)v74;
                }
                else {
                  CFStringRef v76 = @"nil";
                }
                v130[2] = v76;
                v129[3] = @"renderIdentifier";
                v77 = [(TUIRenderModelSection *)v106->_renderModel viewModelWithIndex:v120];
                v78 = [v77 identifier];
                [v78 tui_identifierToString];
                v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
                CFStringRef v79 = v105;
                if (!v105) {
                  CFStringRef v79 = @"nil";
                }
                v129[4] = @"renderReuseIdentifier";
                if (v30) {
                  CFStringRef v80 = v30;
                }
                else {
                  CFStringRef v80 = @"nil";
                }
                v130[3] = v79;
                v130[4] = v80;
                v94 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:5];
                id v81 = [v67 initWithName:@"InvalidReuse" reason:@"A view with the wrong identifier is being re-used" userInfo:v94];

                objc_exception_throw(v81);
              }
            }
          }
          else if (v31)
          {
            goto LABEL_31;
          }
          id v36 = v27;
          id v37 = [v36 zIndex];
          v103 = v106->_renderModel;
          if (v106->_previousRenderModel && sub_1318FC(p_invalidatedViews, (unint64_t *)&v120))
          {
            v38 = [(TUIRenderModelSection *)v106->_previousRenderModel layoutAttributesForViewAtIndexPath:v108 withLiveTransformResolver:v92];
            if (v38)
            {
              v39 = v106->_previousRenderModel;

              id v40 = v38;
              v103 = v39;
              id v36 = v40;
            }
          }
          v41 = [(TUIRenderModelSection *)v103 viewAtIndexPath:v108 factory:v100 host:v99];
          if (v41)
          {
            v114[0] = _NSConcreteStackBlock;
            v114[1] = 3221225472;
            v114[2] = sub_12A448;
            v114[3] = &unk_255D10;
            id v115 = v95;
            id v42 = v41;
            id v119 = v37;
            id v116 = v42;
            v117 = v106;
            id v118 = v36;
            +[UIView performWithoutAnimation:v114];
            if (v106->_currentViewState)
            {
              v111[0] = _NSConcreteStackBlock;
              v111[1] = 3221225472;
              v111[2] = sub_12A7E4;
              v111[3] = &unk_255D38;
              v111[4] = v106;
              unint64_t v113 = (unint64_t)v120;
              id v112 = v42;
              +[UIView performWithoutAnimation:v111];
            }
            [v96 feedView:v97 willDisplayView:v42 atIndexPath:v108];
            [v42 viewWillDisplay];
            *(void *)buf = &v120;
            sub_1319B0((uint64_t)v125, (unint64_t *)&v120, (uint64_t)&std::piecewise_construct, (void **)buf)[3] = v42;
          }
LABEL_32:
        }
        id v24 = [obj countByEnumeratingWithState:&v121 objects:v140 count:16];
      }
      while (v24);
    }
  }
  sub_29920((uint64_t)&v106->_visibleViews, (uint64_t)v125);
  for (k = v106->_reuseSuspendedViews.__table_.__p1_.__value_.__next_; k; k = (void *)*k)
  {
    v45 = sub_1318FC(v125, k + 2);
    if (v45) {
      sub_34E00(v125, v45);
    }
  }
  if (v127)
  {
    for (m = v126; m; m = (uint64_t **)*m)
    {
      uint64_t v47 = (uint64_t)m[2];
      v48 = m[3];
      v49 = [v48 viewStateSave];
      if (v49)
      {
        currentViewState = v106->_currentViewState;
        v51 = [(TUIRenderModelSection *)v106->_renderModel identifierForViewAtIndex:v47];
        [(TUIMutableViewState *)currentViewState setViewState:v49 forIdentifier:v51];
      }
      v52 = +[NSIndexPath tui_indexPathForRow:m[2] inSection:v106->_sectionIndex];
      [v96 feedView:v97 didEndDisplayView:v48 atIndexPath:v52];

      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_12A884;
      v109[3] = &unk_255D60;
      v53 = v48;
      v110 = v53;
      +[UIView performWithoutAnimation:v109];
      v128 = v53;
      v54 = +[NSArray arrayWithObjects:&v128 count:1];
      [v100 viewFactoryReuseSubviews:v54 host:v99];
    }
  }
  v106->_visible = v90;

  sub_1265C((uint64_t)v125);
}

- (void)updateInvalidatedWithHost:(id)a3 liveTransformResolver:(id)a4 factory:(id)a5 feedView:(id)a6
{
  id v47 = a3;
  id v50 = a4;
  id v44 = a5;
  id v51 = a6;
  v10 = [v51 currentUpdateCollection];
  uint64_t v11 = [v10 changes];

  v48 = (void *)v11;
  v45 = [v51 subviewsDelegate];
  v49 = [v51 overrides];
  v53 = [v51 impressionSnapshot];
  v46 = [v51 animatedUpdateCompletionGroup];
  next = self->_invalidatedViews.__table_.__p1_.__value_.__next_;
  if (next)
  {
    char v52 = 0;
    p_visibleViews = &self->_visibleViews;
    id v55 = self;
    id v42 = v63;
    uint64_t v43 = v66;
    do
    {
      *(void *)&v56[0] = next[2];
      v13 = sub_1318FC(p_visibleViews, (unint64_t *)v56);
      v14 = v13;
      if (v13)
      {
        id v15 = (id)v13[3];
        id v16 = +[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", *(void *)&v56[0], v55->_sectionIndex, v42, v43);
        v17 = [(TUIRenderModelSection *)v55->_renderModel layoutAttributesForViewAtIndexPath:v16 withLiveTransformResolver:v50];
        if (v17) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v53 == 0;
        }
        if (!v18)
        {
          v17 = [(TUIRenderModelSection *)v55->_renderModel layoutAttributesForImpressionAtIndexPath:v16 snapshot:v53];
        }
        if (v17)
        {
          if (v49)
          {
            v72 = v17;
            BOOL v19 = +[NSArray arrayWithObjects:&v72 count:1];
            [v51 _updateLayoutAttributes:v19];
          }
          id v20 = [v17 zIndex];
          v21 = [v15 layoutAttributes];
          BOOL v22 = v20 != [v21 zIndex];

          TUIReusableSubviewApplyLayoutAttributes(v15, v17);
          renderModel = v55->_renderModel;
          id v24 = [v48 inserts];
          uint64_t v25 = [v48 updates];
          v26 = [v48 deletes];
          TUIAnimationCollectionViewAnimationForView(renderModel, v15, v17, v24, v25, v26);
          v27 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

          v52 |= v22;
          if (v27)
          {
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v66[0] = sub_12AFC8;
            v66[1] = &unk_255D88;
            id v28 = v51;
            id v67 = v28;
            id v29 = v15;
            id v68 = v29;
            v30 = v46;
            v69 = v30;
            v31 = objc_retainBlock(v65);
            if (v46) {
              dispatch_group_enter(v30);
            }
            [v28 suspendReuseOfView:v29];
            ((void (**)(void, void *))v27)[2](v27, v31);
          }
        }
        else
        {
          v32 = +[NSIndexPath tui_indexPathForRow:*(void *)&v56[0] inSection:v55->_sectionIndex];
          [v45 feedView:v51 didEndDisplayView:v15 atIndexPath:v32];

          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v63[0] = sub_12B018;
          v63[1] = &unk_255D60;
          id v33 = v15;
          v64 = (void (**)(void, void))v33;
          +[UIView performWithoutAnimation:v62];
          id v71 = v33;
          v34 = +[NSArray arrayWithObjects:&v71 count:1];
          [v44 viewFactoryReuseSubviews:v34 host:v47];

          sub_34E00(p_visibleViews, v14);
          v27 = v64;
        }
      }
      next = (void *)*next;
    }
    while (next);
    self = v55;
    if (v52)
    {
      unsigned __int8 v35 = [v47 tui_hostingView];
      id v36 = [v35 subviews];
      id v37 = [v36 sortedArrayUsingComparator:&stru_255DA8];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v38 = v37;
      id v39 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v59;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v59 != v40) {
              objc_enumerationMutation(v38);
            }
            [v35 bringSubviewToFront:*(void *)(*((void *)&v58 + 1) + 8 * i), v42, v43];
          }
          id v39 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v39);
      }

      self = v55;
    }
  }
  memset(v56, 0, sizeof(v56));
  int v57 = 1065353216;
  sub_8CDDC((uint64_t)&self->_invalidatedViews, (uint64_t *)v56);
  sub_1265C((uint64_t)v56);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  if (self->_semanticContentAttribute != a3)
  {
    self->_semanticContentAttribute = a3;
    for (i = (id *)self->_visibleViews.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
      [i[3] setSemanticContentAttribute:self->_semanticContentAttribute];
  }
}

- (id)visibleViewAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (id v9 = objc_msgSend(v4, "tui_row"),
        (v6 = sub_1318FC(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v9)) != 0))
  {
    id v7 = (id)v6[3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)invalidateViewAtIndexPath:(id)a3
{
  id v4 = a3;
  id v6 = [v4 tui_row];
  sub_131BD0((uint64_t)&self->_invalidatedViews, (unint64_t *)&v6, &v6);

  return 1;
}

- (void)suspendReuseOfView:(id)a3
{
  id v4 = a3;
  v5 = [v4 layoutAttributes];
  id v6 = [v5 indexPath];

  id v10 = [v6 tui_row];
  p_reuseSuspendedViews = &self->_reuseSuspendedViews;
  if (!sub_1318FC(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v10))
  {
    v8 = sub_1318FC(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v10);
    if (v8)
    {
      uint64_t v9 = v8[3];
      uint64_t v11 = &v10;
      sub_1319B0((uint64_t)p_reuseSuspendedViews, (unint64_t *)&v10, (uint64_t)&std::piecewise_construct, &v11)[3] = v9;
    }
  }
}

- (void)resumeReuseOfView:(id)a3
{
  id v4 = [a3 layoutAttributes];
  v5 = [v4 indexPath];

  id v7 = [v5 tui_row];
  id v6 = sub_1318FC(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
  if (v6)
  {
    sub_1318FC(&self->_visibleViews.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
    sub_34E00(&self->_reuseSuspendedViews.__table_.__bucket_list_.__ptr_.__value_, v6);
  }
}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (TUIRenderModelSection)previousRenderModel
{
  return self->_previousRenderModel;
}

- (void)setPreviousRenderModel:(id)a3
{
}

- (TUIMutableViewState)currentViewState
{
  return self->_currentViewState;
}

- (void)setCurrentViewState:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndedouble x = a3;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewState, 0);
  objc_storeStrong((id *)&self->_previousRenderModel, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  sub_1265C((uint64_t)&self->_invalidatedViews);
  sub_1265C((uint64_t)&self->_visibleViews);

  sub_1265C((uint64_t)&self->_reuseSuspendedViews);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end